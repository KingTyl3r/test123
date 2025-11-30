# Server Event Documentation for Custom NUI Integration

This document describes the server events that need to be implemented to support the custom NUI inventory system for backpack metadata persistence and drag/drop item moves.

## Events Overview

The custom NUI integration requires the following server-side events to be handled:

1. `ox_inventory:customNUI:moveItem` - Handle item moves from drag & drop
2. `ox_inventory:useHotkey` - Handle hotkey item usage
3. `ox_inventory:updateItemMeta` - Update item metadata (e.g., backpack contents)

---

## 1. ox_inventory:customNUI:moveItem

**Purpose:** Validate and process item movements between inventory slots, including moves to/from equipment slots and backpack.

**Payload:**
```lua
{
    fromSlot = number,      -- Source slot number
    fromSource = string,    -- 'main', 'backpack', 'equipment'
    toSlot = number|string, -- Destination slot (number for inventory, string for equipment slots)
    toSource = string,      -- 'main', 'backpack', 'equipment'
    item = table,           -- Item data being moved
    count = number          -- Number of items to move
}
```

**Implementation Example:**
```lua
RegisterNetEvent('ox_inventory:customNUI:moveItem', function(data)
    local source = source
    local player = Inventory(source)
    
    if not player then return end
    
    -- Validate the move
    local fromSlot = data.fromSlot
    local toSlot = data.toSlot
    local count = data.count or 1
    
    -- Handle different source/destination types
    if data.fromSource == 'main' and data.toSource == 'main' then
        -- Standard inventory swap - use existing ox_inventory swap logic
        -- exports.ox_inventory:SwapItems(source, fromSlot, toSlot, count)
        
    elseif data.fromSource == 'main' and data.toSource == 'equipment' then
        -- Equipping item to equipment slot
        -- Validate item can be equipped to this slot type
        -- Update player's equipped items
        
    elseif data.fromSource == 'equipment' and data.toSource == 'main' then
        -- Unequipping item from equipment slot
        -- Find empty slot in main inventory
        -- Move item to main inventory
        
    elseif data.fromSource == 'main' and data.toSource == 'backpack' then
        -- Moving item to backpack
        -- Check if player has backpack equipped
        -- Validate backpack has space
        -- Update backpack metadata
        TriggerEvent('ox_inventory:updateItemMeta', source, 'backpack', {
            action = 'addItem',
            slot = toSlot,
            item = data.item
        })
        
    elseif data.fromSource == 'backpack' and data.toSource == 'main' then
        -- Moving item from backpack to main
        -- Update backpack metadata to remove item
        TriggerEvent('ox_inventory:updateItemMeta', source, 'backpack', {
            action = 'removeItem',
            slot = fromSlot
        })
    end
    
    -- Notify client of successful move
    TriggerClientEvent('ox_inventory:updateSlots', source, {
        -- Updated slot data
    })
end)
```

---

## 2. ox_inventory:useHotkey

**Purpose:** Handle hotkey item usage (keys 1-5).

**Payload:**
```lua
key = number  -- Hotkey number (1-5)
```

**Implementation Example:**
```lua
RegisterNetEvent('ox_inventory:useHotkey', function(key)
    local source = source
    local player = Inventory(source)
    
    if not player then return end
    
    -- Keys 1-2 are typically weapon slots
    if key == 1 or key == 2 then
        local weaponSlot = 'weapon' .. key
        -- Handle weapon equip/unequip logic
        -- This may already be handled by ox_inventory's weapon system
        
    -- Keys 3-5 are quick-use slots
    elseif key >= 3 and key <= 5 then
        -- Use item in the corresponding slot
        -- By default, hotkeys map to inventory slots 1-5
        local slot = key
        local item = player.items[slot]
        
        if item then
            -- Trigger item use
            -- exports.ox_inventory:UseItem(source, item.name, slot)
        end
    end
end)
```

---

## 3. ox_inventory:updateItemMeta

**Purpose:** Update metadata for items that store additional data (like backpacks storing their contents).

**Payload:**
```lua
{
    playerId = number,      -- Player server ID
    itemType = string,      -- Type of item ('backpack', etc.)
    updateData = table      -- Data to update
}
```

**Implementation Example:**
```lua
RegisterNetEvent('ox_inventory:updateItemMeta', function(playerId, itemType, updateData)
    local player = Inventory(playerId)
    
    if not player then return end
    
    if itemType == 'backpack' then
        -- Find the equipped backpack item
        local backpackSlot = nil
        for slot, item in pairs(player.items) do
            if item and item.name:find('backpack') then
                backpackSlot = slot
                break
            end
        end
        
        if not backpackSlot then return end
        
        local backpack = player.items[backpackSlot]
        local metadata = backpack.metadata or {}
        
        -- Initialize contents if not exists
        if not metadata.contents then
            metadata.contents = {}
        end
        
        -- Handle different update actions
        if updateData.action == 'addItem' then
            metadata.contents[updateData.slot] = updateData.item
            
        elseif updateData.action == 'removeItem' then
            metadata.contents[updateData.slot] = nil
            
        elseif updateData.action == 'moveItem' then
            local item = metadata.contents[updateData.fromSlot]
            metadata.contents[updateData.fromSlot] = nil
            metadata.contents[updateData.toSlot] = item
        end
        
        -- Update the backpack's metadata
        exports.ox_inventory:SetMetadata(playerId, backpackSlot, metadata)
        
        -- Notify client of the update
        TriggerClientEvent('ox_inventory:updateSlots', playerId, {
            { item = player.items[backpackSlot], inventory = playerId }
        })
    end
end)
```

---

## Backpack Metadata Structure

When using backpacks with the custom NUI, the backpack item's metadata should follow this structure:

```lua
{
    -- Standard ox_inventory metadata
    durability = 100,
    
    -- Custom backpack data
    size = { slots = 12, maxWeight = 15000 },  -- Backpack capacity
    contents = {
        [1] = { name = 'water', count = 2, metadata = {} },
        [2] = nil,  -- Empty slot
        [3] = { name = 'bandage', count = 5, metadata = { durability = 100 } },
        -- ... more slots
    }
}
```

---

## Integration Steps

1. **Add the server event handlers** to your `server.lua` or a separate server script file.

2. **Configure backpack items** in your item definitions to include the necessary metadata structure:
```lua
['backpack'] = {
    label = 'Backpack',
    weight = 500,
    stack = false,
    close = true,
    -- Add default metadata for new backpacks
    metadata = {
        size = { slots = 12, maxWeight = 15000 },
        contents = {}
    }
}
```

3. **Test the integration:**
   - Open the custom NUI
   - Try moving items between main inventory and backpack
   - Verify items persist after closing and reopening inventory
   - Test hotkey usage

4. **Handle edge cases:**
   - What happens when backpack is removed while containing items?
   - Weight calculations for backpack + contents
   - Stacking items within backpack

---

## Notes

- The server-side validation is crucial for preventing item duplication exploits.
- Always validate that the player actually has the items being moved.
- Consider adding logging for item movements for debugging and anti-cheat purposes.
- The backpack system described here is a suggested implementation - adapt it to your server's needs.
