# Server-Side Event Documentation

This document describes the server-side events that must be implemented to support the custom NUI inventory system.

## Required Events

### ox_inventory:moveItem

Handles item movement between inventory slots, including moves to/from backpacks.

**Parameters:**
```lua
-- data table:
{
    fromSlot = number,       -- Source slot (1-indexed)
    toSlot = number,         -- Destination slot (1-indexed)
    fromInventory = string,  -- Source inventory type: 'player', 'backpack', 'equipment', 'hotkey'
    toInventory = string,    -- Destination inventory type
    count = number           -- Number of items to move
}
```

**Example Implementation:**
```lua
RegisterNetEvent('ox_inventory:moveItem', function(data)
    local source = source
    local player = GetPlayerIdentifier(source)
    
    -- Validate the move
    if not data.fromSlot or not data.toSlot then
        return TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Invalid move request' })
    end
    
    -- Get player inventory
    local playerInventory = exports.ox_inventory:GetInventory(source)
    
    -- Handle different inventory types
    if data.fromInventory == 'player' and data.toInventory == 'player' then
        -- Standard inventory swap
        local success = exports.ox_inventory:SwapSlots(source, data.fromSlot, data.toSlot, data.count)
        if success then
            TriggerClientEvent('ox_nui:updateInventory', source, { items = playerInventory.items, weight = playerInventory.weight })
        end
    elseif data.fromInventory == 'backpack' or data.toInventory == 'backpack' then
        -- Handle backpack moves - see ox_inventory:updateItemMeta
        -- TODO: Implement backpack slot moves
    end
end)
```

---

### ox_inventory:useHotkey

Handles hotkey item usage (keys 1-5 for quick access slots).

**Parameters:**
```lua
-- slotName: string - 'weapon1', 'weapon2', 'hotkey3', 'hotkey4', 'hotkey5'
-- slotNumber: number - The slot number (1-5)
```

**Example Implementation:**
```lua
RegisterNetEvent('ox_inventory:useHotkey', function(slotName, slotNumber)
    local source = source
    
    -- Get the item in the hotkey slot
    local item = exports.ox_inventory:GetSlot(source, slotNumber)
    
    if not item then
        return TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'No item in slot' })
    end
    
    -- Use the item
    exports.ox_inventory:UseSlot(source, slotNumber)
end)
```

---

### ox_inventory:updateItemMeta

Updates item metadata, primarily used for storing backpack contents.

**Parameters:**
```lua
-- data table:
{
    slot = number,           -- Slot containing the item
    metadata = table,        -- New metadata to merge
    action = string          -- 'set' to replace, 'merge' to merge with existing
}
```

**Example Implementation:**
```lua
RegisterNetEvent('ox_inventory:updateItemMeta', function(data)
    local source = source
    
    if not data.slot or not data.metadata then
        return TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Invalid metadata update' })
    end
    
    local item = exports.ox_inventory:GetSlot(source, data.slot)
    
    if not item then
        return TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Item not found' })
    end
    
    -- Update metadata
    local newMetadata = item.metadata or {}
    
    if data.action == 'set' then
        newMetadata = data.metadata
    else
        for k, v in pairs(data.metadata) do
            newMetadata[k] = v
        end
    end
    
    -- Apply the metadata update
    exports.ox_inventory:SetMetadata(source, data.slot, newMetadata)
    
    -- Notify client of the update
    TriggerClientEvent('ox_nui:updateInventory', source, {
        items = exports.ox_inventory:GetInventory(source).items,
        weight = exports.ox_inventory:GetInventory(source).weight
    })
end)
```

---

### ox_inventory:dropItem

Handles dropping items from inventory.

**Parameters:**
```lua
-- slot: number - The slot to drop from
-- count: number - Number of items to drop
```

**Example Implementation:**
```lua
RegisterNetEvent('ox_inventory:dropItem', function(slot, count)
    local source = source
    
    -- Use ox_inventory's drop functionality
    exports.ox_inventory:DropSlot(source, slot, count)
end)
```

---

## Backpack System Implementation

To fully support backpacks in the custom NUI, implement the following:

### 1. Backpack Item Definition

Add backpack items to your items database with metadata support:

```lua
['backpack_small'] = {
    label = 'Small Backpack',
    weight = 500,
    stack = false,
    close = true,
    description = 'A small backpack with extra storage',
    -- Custom backpack properties
    backpack = {
        slots = 8,
        maxWeight = 5000
    }
}
```

### 2. Backpack Metadata Structure

When a backpack is equipped, store its contents in metadata:

```lua
metadata = {
    slots = 8,           -- Number of slots
    maxWeight = 5000,    -- Max weight capacity
    inventory = {        -- Contents of backpack
        [1] = { name = 'water', count = 2, weight = 1000 },
        [2] = { name = 'bandage', count = 5, weight = 250 },
        -- ... more items
    },
    weight = 1250        -- Current weight
}
```

### 3. Sync Backpack Contents

Create a function to sync backpack contents:

```lua
local function syncBackpackToClient(source)
    local backpackSlot = GetEquippedBackpackSlot(source) -- Implement this
    if not backpackSlot then return end
    
    local backpack = exports.ox_inventory:GetSlot(source, backpackSlot)
    if not backpack then return end
    
    TriggerClientEvent('ox_nui:updateInventory', source, {
        backpack = {
            enabled = true,
            slots = backpack.metadata.slots,
            maxWeight = backpack.metadata.maxWeight,
            inventory = backpack.metadata.inventory,
            weight = backpack.metadata.weight
        }
    })
end
```

---

## Notes

- All slot numbers in the server events are 1-indexed (Lua standard)
- The NUI sends 0-indexed slots, so the client integration adds 1 before sending to server
- Implement proper validation and anti-cheat measures for all item movements
- Consider rate limiting for inventory actions to prevent exploits
- The `ox_inventory:moveItem` event should validate that the player owns both source and destination inventories

## TODO Items

The following features need server-side implementation:

1. **Backpack inventory persistence** - Store and retrieve backpack contents from database
2. **Equipment slot validation** - Validate items can be equipped in specific slots
3. **Weight calculations** - Calculate total weight including backpack contents
4. **Item stacking** - Handle proper item stacking when moving items
5. **Transaction logging** - Log all inventory transactions for auditing
