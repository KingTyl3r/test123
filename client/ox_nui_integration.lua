--[[
    OX Inventory - Custom NUI Integration
    Client-side glue for the modern red/blue themed inventory UI
    
    This file intercepts inventory open events and forwards them to the custom NUI
    while maintaining compatibility with the existing ox_inventory backend.
]]

-- Configuration
local Config = {
    UseCustomNUI = true,  -- Set to true to use the custom NUI, false to use default
    Debug = false
}

-- State
local isNuiOpen = false

-- Debug logging
local function debugLog(...)
    if Config.Debug then
        print('[OX_NUI]', ...)
    end
end

-- Build normalized payload for the NUI
local function buildNUIPayload(playerData, rightInventory)
    local payload = {
        items = {},
        equipment = {},
        hotkeys = {},
        backpack = nil,
        limbHealth = {
            head = 100,
            leftArm = 100,
            rightArm = 100,
            body = 100,
            leftLeg = 100,
            rightLeg = 100
        },
        weight = playerData and playerData.weight or 0,
        maxWeight = playerData and playerData.maxWeight or 30000
    }
    
    -- Convert inventory items
    if playerData and playerData.inventory then
        for slot, item in pairs(playerData.inventory) do
            if item then
                table.insert(payload.items, {
                    slot = item.slot,
                    name = item.name,
                    label = item.label,
                    count = item.count,
                    weight = item.weight,
                    description = item.description,
                    metadata = item.metadata
                })
            end
        end
    end
    
    -- TODO: Extract equipment slots from inventory
    -- This depends on how your server defines equipment slots
    
    -- TODO: Extract hotkey items (slots 1-5 by default in ox_inventory)
    -- Hotkeys are typically the first 5 slots
    for i = 1, 5 do
        local slotName = 'hotkey' .. i
        if playerData and playerData.inventory and playerData.inventory[i] then
            local item = playerData.inventory[i]
            payload.hotkeys[slotName] = {
                name = item.name,
                label = item.label,
                count = item.count
            }
        end
    end
    
    -- TODO: Check for equipped backpack and build backpack data
    -- This requires custom metadata handling on the server
    
    -- Get limb health if available (requires external health system)
    -- Example: If using a limb health resource
    if GetResourceState('limb_health') == 'started' then
        local success, limbData = pcall(function()
            return exports['limb_health']:getLimbHealth()
        end)
        if success and limbData then
            payload.limbHealth = limbData
        end
    end
    
    return payload
end

-- Open the custom NUI
local function openCustomNUI(payload)
    if isNuiOpen then return end
    
    debugLog('Opening custom NUI')
    
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openInventory',
        payload = payload
    })
    
    isNuiOpen = true
end

-- Close the custom NUI
local function closeCustomNUI()
    if not isNuiOpen then return end
    
    debugLog('Closing custom NUI')
    
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'closeInventory'
    })
    
    isNuiOpen = false
end

-- Update the NUI with new inventory data
local function updateNUI(payload)
    if not isNuiOpen then return end
    
    debugLog('Updating NUI')
    
    SendNUIMessage({
        action = 'updateInventory',
        payload = payload
    })
end

-- Update limb health display
local function updateLimbHealth(limbHealth)
    if not isNuiOpen then return end
    
    SendNUIMessage({
        action = 'updateLimbHealth',
        payload = limbHealth
    })
end

-- NUI Callbacks

-- Handle NUI close
RegisterNUICallback('nuiClose', function(data, cb)
    debugLog('NUI close callback received')
    closeCustomNUI()
    
    -- Trigger the standard ox_inventory close event
    TriggerEvent('ox_inventory:closeInventory')
    
    cb('ok')
end)

-- Handle drag and drop
RegisterNUICallback('dragDrop', function(data, cb)
    debugLog('Drag drop:', json.encode(data))
    
    -- Forward to server for validation and processing
    -- The server should validate the move and update inventories accordingly
    TriggerServerEvent('ox_inventory:customNUI:moveItem', {
        fromSlot = data.fromSlot,
        fromSource = data.fromSource,
        toSlot = data.toSlot,
        toSource = data.toSource,
        item = data.item,
        count = data.count
    })
    
    cb('ok')
end)

-- Handle item use
RegisterNUICallback('useItem', function(data, cb)
    debugLog('Use item:', json.encode(data))
    
    -- Use the standard ox_inventory item use
    if data.slot then
        exports.ox_inventory:useSlot(data.slot)
    end
    
    cb('ok')
end)

-- Handle hotkey use
RegisterNUICallback('useHotkey', function(data, cb)
    debugLog('Use hotkey:', data.key)
    
    -- Trigger hotkey server event
    TriggerServerEvent('ox_inventory:useHotkey', data.key)
    
    cb('ok')
end)

-- Key Mappings for hotkeys 1-5
-- These allow players to use hotkey items even when inventory is closed
RegisterCommand('+ox_nui_hotkey1', function()
    if not isNuiOpen then
        TriggerServerEvent('ox_inventory:useHotkey', 1)
    end
end, false)

RegisterCommand('+ox_nui_hotkey2', function()
    if not isNuiOpen then
        TriggerServerEvent('ox_inventory:useHotkey', 2)
    end
end, false)

RegisterCommand('+ox_nui_hotkey3', function()
    if not isNuiOpen then
        TriggerServerEvent('ox_inventory:useHotkey', 3)
    end
end, false)

RegisterCommand('+ox_nui_hotkey4', function()
    if not isNuiOpen then
        TriggerServerEvent('ox_inventory:useHotkey', 4)
    end
end, false)

RegisterCommand('+ox_nui_hotkey5', function()
    if not isNuiOpen then
        TriggerServerEvent('ox_inventory:useHotkey', 5)
    end
end, false)

-- Register key mappings
RegisterKeyMapping('+ox_nui_hotkey1', 'Custom NUI Hotkey 1 (Weapon)', 'keyboard', '1')
RegisterKeyMapping('+ox_nui_hotkey2', 'Custom NUI Hotkey 2 (Weapon)', 'keyboard', '2')
RegisterKeyMapping('+ox_nui_hotkey3', 'Custom NUI Hotkey 3', 'keyboard', '3')
RegisterKeyMapping('+ox_nui_hotkey4', 'Custom NUI Hotkey 4', 'keyboard', '4')
RegisterKeyMapping('+ox_nui_hotkey5', 'Custom NUI Hotkey 5', 'keyboard', '5')

-- Event Handlers

-- Listen for inventory updates to refresh the NUI
RegisterNetEvent('ox_inventory:updateSlots', function(items, weight)
    if not isNuiOpen or not Config.UseCustomNUI then return end
    
    -- Build update payload
    local payload = {
        items = {},
        weight = weight
    }
    
    for _, v in pairs(items) do
        if v.item then
            table.insert(payload.items, {
                slot = v.item.slot,
                name = v.item.name,
                label = v.item.label,
                count = v.item.count,
                weight = v.item.weight,
                description = v.item.description,
                metadata = v.item.metadata
            })
        end
    end
    
    updateNUI(payload)
end)

-- Export for external use
exports('openCustomNUI', function(payload)
    if Config.UseCustomNUI then
        openCustomNUI(payload or {})
    end
end)

exports('closeCustomNUI', closeCustomNUI)
exports('updateCustomNUI', updateNUI)
exports('updateLimbHealth', updateLimbHealth)
exports('isCustomNUIOpen', function() return isNuiOpen end)

-- Expose event for opening custom NUI with payload
RegisterNetEvent('ox_inventory:openCustomNUI', function(payload)
    if Config.UseCustomNUI then
        openCustomNUI(payload)
    end
end)

-- Expose event for closing custom NUI
RegisterNetEvent('ox_inventory:closeCustomNUI', function()
    closeCustomNUI()
end)

-- Example: Hook into the standard inventory open event
-- This is optional and can be enabled by uncommenting
--[[
AddEventHandler('ox_inventory:openInventory', function(inv, data)
    if Config.UseCustomNUI and not isNuiOpen then
        -- Build payload from current player data
        local playerData = {
            inventory = exports.ox_inventory:GetPlayerItems(),
            weight = exports.ox_inventory:GetPlayerWeight(),
            maxWeight = exports.ox_inventory:GetPlayerMaxWeight()
        }
        
        local payload = buildNUIPayload(playerData, nil)
        openCustomNUI(payload)
        
        -- Cancel the default inventory open
        return true
    end
end)
]]

debugLog('Custom NUI Integration loaded')
