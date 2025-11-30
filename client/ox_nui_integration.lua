--[[
    ox_nui_integration.lua
    Client-side integration for the modern NUI inventory UI
    
    This file intercepts ox_inventory events and opens the custom NUI when configured.
    It also registers hotkey bindings and forwards NUI callbacks to the server.

    IMPORTANT: Set Config.UseCustomNUI = true to enable the custom UI
]]

-- Configuration
local Config = {
    UseCustomNUI = false,  -- Set to true to use the custom red/blue NUI instead of default ox_inventory UI
    ImagePath = 'nui://ox_inventory/web/images/',
    DefaultSlots = 24,     -- 8x3 grid
}

-- State tracking
local isNUIOpen = false
local currentInventoryData = nil

-- Helper function to build normalized inventory payload for NUI
local function buildNUIPayload(playerInventory, playerWeight, playerMaxWeight)
    local items = {}
    local equipment = {}
    local hotkeys = {}

    -- Process inventory items
    if playerInventory then
        for slot, item in pairs(playerInventory) do
            if item and item.name then
                items[slot] = {
                    name = item.name,
                    label = item.label or item.name,
                    count = item.count or 1,
                    weight = item.weight or 0,
                    description = item.description,
                    metadata = item.metadata or {}
                }

                -- Check for equipment slots (weapon1, weapon2 are slots 1, 2)
                -- TODO: Adjust slot mapping based on your inventory configuration
                if slot == 1 then
                    equipment.weapon1 = items[slot]
                elseif slot == 2 then
                    equipment.weapon2 = items[slot]
                end

                -- Hotkey slots (3, 4, 5)
                if slot == 3 then
                    hotkeys.hotkey3 = items[slot]
                elseif slot == 4 then
                    hotkeys.hotkey4 = items[slot]
                elseif slot == 5 then
                    hotkeys.hotkey5 = items[slot]
                end
            end
        end
    end

    -- Build backpack data if player has one equipped
    -- TODO: Implement backpack detection based on your inventory system
    local backpackData = nil
    --[[
    local backpackItem = GetEquippedBackpack() -- Implement this function
    if backpackItem then
        backpackData = {
            enabled = true,
            slots = backpackItem.metadata.slots or 12,
            maxWeight = backpackItem.metadata.maxWeight or 10000,
            inventory = backpackItem.metadata.inventory or {},
            weight = CalculateBackpackWeight(backpackItem.metadata.inventory) -- Implement this
        }
    end
    ]]

    -- Get player health data for limb display
    -- TODO: Integrate with your health/injury system
    local healthData = {
        head = 100,
        leftArm = 100,
        rightArm = 100,
        body = 100,
        leftLeg = 100,
        rightLeg = 100
    }

    return {
        inventory = items,
        weight = playerWeight or 0,
        maxWeight = playerMaxWeight or 30000,
        slots = Config.DefaultSlots,
        imagePath = Config.ImagePath,
        equipment = equipment,
        hotkeys = hotkeys,
        backpack = backpackData,
        health = healthData
    }
end

-- Open the custom NUI
local function openCustomNUI(inventoryData)
    if isNUIOpen then return end

    local payload = buildNUIPayload(
        inventoryData.items or PlayerData.inventory,
        inventoryData.weight or PlayerData.weight,
        inventoryData.maxWeight or shared.playerweight
    )

    payload.action = 'openInventory'

    SendNUIMessage(payload)
    SetNuiFocus(true, true)
    isNUIOpen = true
    currentInventoryData = inventoryData
end

-- Close the custom NUI
local function closeCustomNUI()
    if not isNUIOpen then return end

    SendNUIMessage({ action = 'closeInventory' })
    SetNuiFocus(false, false)
    isNUIOpen = false
    currentInventoryData = nil
end

-- Update NUI when inventory changes
local function updateCustomNUI(inventoryData)
    if not isNUIOpen then return end

    local payload = buildNUIPayload(
        inventoryData.items or PlayerData.inventory,
        inventoryData.weight or PlayerData.weight,
        inventoryData.maxWeight or shared.playerweight
    )

    payload.action = 'updateInventory'
    SendNUIMessage(payload)
end

-- NUI Callbacks

-- Close callback
RegisterNUICallback('nuiClose', function(data, cb)
    closeCustomNUI()
    -- Notify ox_inventory that the inventory was closed
    TriggerEvent('ox_inventory:closeInventory')
    cb('ok')
end)

-- Drag and drop callback
RegisterNUICallback('dragDrop', function(data, cb)
    --[[
        data = {
            fromSlot = number,
            fromType = 'main' | 'backpack' | 'equipment' | 'hotkey',
            toSlot = number,
            toType = 'main' | 'backpack' | 'equipment' | 'hotkey',
            item = string (item name),
            count = number
        }
    ]]

    -- Convert NUI slot types to ox_inventory compatible format
    local fromInventory = data.fromType == 'main' and 'player' or data.fromType
    local toInventory = data.toType == 'main' and 'player' or data.toType

    -- Trigger server event to validate and perform the move
    -- TODO: Adjust event name if your server uses different events
    TriggerServerEvent('ox_inventory:moveItem', {
        fromSlot = data.fromSlot + 1,  -- Convert from 0-indexed to 1-indexed
        toSlot = data.toSlot + 1,
        fromInventory = fromInventory,
        toInventory = toInventory,
        count = data.count or 1
    })

    cb('ok')
end)

-- Use item callback
RegisterNUICallback('useItem', function(data, cb)
    local slot = data.slot + 1  -- Convert from 0-indexed to 1-indexed

    -- Use the ox_inventory useSlot export
    if exports.ox_inventory then
        exports.ox_inventory:useSlot(slot)
    else
        -- Fallback: trigger event directly
        TriggerEvent('ox_inventory:item', { slot = slot, close = false })
    end

    cb('ok')
end)

-- Drop item callback
RegisterNUICallback('dropItem', function(data, cb)
    local slot = data.slot + 1  -- Convert from 0-indexed to 1-indexed
    local count = data.count or 1

    -- Create a drop with the item
    -- TODO: Implement drop logic or use ox_inventory's drop system
    TriggerServerEvent('ox_inventory:dropItem', slot, count)

    cb('ok')
end)

-- Mode changed callback (Inventory/Utility toggle)
RegisterNUICallback('modeChanged', function(data, cb)
    -- Handle mode change if needed
    -- data.mode = 'inventory' | 'utility'
    cb('ok')
end)

-- Register Hotkey Bindings for keys 1-5
-- Keys 1 & 2 are mapped to weapon slots (instant equip)
-- Keys 3, 4, 5 are extra hotkeys (instant use)

RegisterKeyMapping('ox_hotkey_1', 'Use Hotkey Slot 1 (Weapon)', 'keyboard', '1')
RegisterKeyMapping('ox_hotkey_2', 'Use Hotkey Slot 2 (Weapon)', 'keyboard', '2')
RegisterKeyMapping('ox_hotkey_3', 'Use Hotkey Slot 3', 'keyboard', '3')
RegisterKeyMapping('ox_hotkey_4', 'Use Hotkey Slot 4', 'keyboard', '4')
RegisterKeyMapping('ox_hotkey_5', 'Use Hotkey Slot 5', 'keyboard', '5')

-- Hotkey command handlers
RegisterCommand('ox_hotkey_1', function()
    if not isNUIOpen and not IsPauseMenuActive() then
        TriggerServerEvent('ox_inventory:useHotkey', 'weapon1', 1)
    end
end, false)

RegisterCommand('ox_hotkey_2', function()
    if not isNUIOpen and not IsPauseMenuActive() then
        TriggerServerEvent('ox_inventory:useHotkey', 'weapon2', 2)
    end
end, false)

RegisterCommand('ox_hotkey_3', function()
    if not isNUIOpen and not IsPauseMenuActive() then
        TriggerServerEvent('ox_inventory:useHotkey', 'hotkey3', 3)
    end
end, false)

RegisterCommand('ox_hotkey_4', function()
    if not isNUIOpen and not IsPauseMenuActive() then
        TriggerServerEvent('ox_inventory:useHotkey', 'hotkey4', 4)
    end
end, false)

RegisterCommand('ox_hotkey_5', function()
    if not isNUIOpen and not IsPauseMenuActive() then
        TriggerServerEvent('ox_inventory:useHotkey', 'hotkey5', 5)
    end
end, false)

-- Event to open custom NUI (can be called from other scripts)
RegisterNetEvent('ox_nui:openInventory', function(data)
    if Config.UseCustomNUI then
        openCustomNUI(data or {})
    end
end)

-- Event to close custom NUI
RegisterNetEvent('ox_nui:closeInventory', function()
    closeCustomNUI()
end)

-- Event to update custom NUI
RegisterNetEvent('ox_nui:updateInventory', function(data)
    if Config.UseCustomNUI then
        updateCustomNUI(data or {})
    end
end)

-- Event to update health display
RegisterNetEvent('ox_nui:updateHealth', function(healthData)
    if isNUIOpen then
        SendNUIMessage({
            action = 'updateHealth',
            health = healthData
        })
    end
end)

-- Intercept ox_inventory open event when custom NUI is enabled
-- This allows the custom NUI to be used instead of the default ox_inventory UI
if Config.UseCustomNUI then
    -- Override the default inventory open behavior
    -- TODO: You may need to adjust this based on how ox_inventory opens its UI
    AddEventHandler('ox_inventory:openInventory', function(...)
        -- Prevent default behavior and open custom NUI instead
        -- Note: This may require modifications to work correctly with ox_inventory
        -- as the default UI opening is handled internally

        -- For now, this serves as a hook point
        -- Developers should modify ox_inventory's client.openInventory function
        -- to call TriggerEvent('ox_nui:openInventory', data) when Config.UseCustomNUI is true
    end)
end

-- Export functions for external use
exports('openCustomNUI', openCustomNUI)
exports('closeCustomNUI', closeCustomNUI)
exports('updateCustomNUI', updateCustomNUI)
exports('isCustomNUIOpen', function() return isNUIOpen end)

--[[
    INTEGRATION NOTES:
    
    To fully integrate this custom NUI with ox_inventory, you will need to:
    
    1. Set Config.UseCustomNUI = true in this file
    
    2. Modify ox_inventory's client.lua openInventory function to check for custom NUI:
       - Add a check at the start: if Config.UseCustomNUI then TriggerEvent('ox_nui:openInventory', data) return end
    
    3. Implement the server-side events:
       - ox_inventory:moveItem - Validate and perform inventory moves
       - ox_inventory:useHotkey - Handle hotkey item usage
       - ox_inventory:dropItem - Handle item drops
       - ox_inventory:updateItemMeta - Update item metadata (e.g., backpack contents)
    
    4. For backpack functionality, implement:
       - A function to detect equipped backpack items
       - Server-side storage for backpack inventory contents
       - Events to sync backpack contents between client and server
    
    5. For limb health display, integrate with your damage/injury system:
       - Call TriggerEvent('ox_nui:updateHealth', healthData) when player health changes
       - healthData should contain: head, leftArm, rightArm, body, leftLeg, rightLeg (0-100 values)
]]
