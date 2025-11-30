/**
 * Modern OX Inventory NUI Script
 * Handles message receiving, rendering, drag & drop, tooltips, and preview helpers
 */

(function() {
    'use strict';

    // Configuration
    const CONFIG = {
        mainSlots: 24,      // 8x3 grid
        backpackSlots: 0,   // Set dynamically based on equipped backpack
        imagePath: 'nui://ox_inventory/web/images',
        debug: false
    };

    // State
    const state = {
        inventory: [],
        equipment: {},
        hotkeys: {},
        backpack: null,
        limbHealth: {
            head: 100,
            leftArm: 100,
            rightArm: 100,
            body: 100,
            leftLeg: 100,
            rightLeg: 100
        },
        weight: 0,
        maxWeight: 30000,
        draggedItem: null,
        draggedSlot: null,
        draggedSource: null
    };

    // DOM Elements
    let container;
    let mainInventory;
    let backpackInventory;
    let backpackSection;
    let tooltip;
    let previewHelper;

    /**
     * Initialize the UI
     */
    function init() {
        container = document.getElementById('inventory-container');
        mainInventory = document.getElementById('main-inventory');
        backpackInventory = document.getElementById('backpack-inventory');
        backpackSection = document.getElementById('backpack-section');
        tooltip = document.getElementById('tooltip');
        previewHelper = document.getElementById('preview-helper');

        // Generate inventory slots
        generateSlots(mainInventory, CONFIG.mainSlots, 'main');

        // Setup event listeners
        setupEventListeners();

        // Setup NUI message listener
        setupNUIListener();

        // Show preview helper in browser (not in game)
        if (typeof GetParentResourceName === 'undefined') {
            previewHelper.classList.remove('hidden');
            document.getElementById('btn-preview').addEventListener('click', showPreview);
        }

        log('UI Initialized');
    }

    /**
     * Generate inventory slot elements
     */
    function generateSlots(container, count, type) {
        container.innerHTML = '';
        for (let i = 0; i < count; i++) {
            const slot = document.createElement('div');
            slot.className = 'inventory-slot';
            slot.dataset.slot = i + 1;
            slot.dataset.type = type;
            
            const slotNumber = document.createElement('span');
            slotNumber.className = 'slot-number';
            slotNumber.textContent = i + 1;
            slot.appendChild(slotNumber);

            slot.draggable = true;
            slot.addEventListener('dragstart', handleDragStart);
            slot.addEventListener('dragend', handleDragEnd);
            slot.addEventListener('dragover', handleDragOver);
            slot.addEventListener('drop', handleDrop);
            slot.addEventListener('dragenter', handleDragEnter);
            slot.addEventListener('dragleave', handleDragLeave);
            slot.addEventListener('mouseenter', handleSlotHover);
            slot.addEventListener('mouseleave', handleSlotLeave);
            slot.addEventListener('contextmenu', handleRightClick);

            container.appendChild(slot);
        }
    }

    /**
     * Setup event listeners
     */
    function setupEventListeners() {
        // Mode toggle buttons
        document.getElementById('btn-inventory').addEventListener('click', () => setMode('inventory'));
        document.getElementById('btn-utility').addEventListener('click', () => setMode('utility'));

        // Close button
        document.getElementById('btn-close').addEventListener('click', closeInventory);

        // Keyboard shortcuts
        document.addEventListener('keydown', handleKeyDown);

        // Equipment slots
        document.querySelectorAll('.equipment-slot, .hotkey-slot').forEach(slot => {
            slot.addEventListener('dragover', handleDragOver);
            slot.addEventListener('drop', handleEquipmentDrop);
            slot.addEventListener('dragenter', handleDragEnter);
            slot.addEventListener('dragleave', handleDragLeave);
            slot.addEventListener('mouseenter', handleEquipmentHover);
            slot.addEventListener('mouseleave', handleSlotLeave);
        });
    }

    /**
     * Setup NUI message listener
     */
    function setupNUIListener() {
        window.addEventListener('message', function(event) {
            const data = event.data;

            switch (data.action) {
                case 'openInventory':
                    openInventory(data.payload);
                    break;
                case 'closeInventory':
                    closeInventory();
                    break;
                case 'updateInventory':
                    updateInventory(data.payload);
                    break;
                case 'updateLimbHealth':
                    updateLimbHealth(data.payload);
                    break;
                case 'updateWeight':
                    updateWeight(data.weight, data.maxWeight);
                    break;
                case 'updateSlot':
                    updateSlot(data.slot, data.item, data.source);
                    break;
                default:
                    log('Unknown action:', data.action);
            }
        });
    }

    /**
     * Open the inventory UI
     */
    function openInventory(payload) {
        if (payload) {
            // Update state with payload data
            if (payload.items) {
                state.inventory = payload.items;
            }
            if (payload.equipment) {
                state.equipment = payload.equipment;
            }
            if (payload.hotkeys) {
                state.hotkeys = payload.hotkeys;
            }
            if (payload.backpack) {
                state.backpack = payload.backpack;
            }
            if (payload.limbHealth) {
                state.limbHealth = payload.limbHealth;
            }
            if (payload.weight !== undefined) {
                state.weight = payload.weight;
            }
            if (payload.maxWeight !== undefined) {
                state.maxWeight = payload.maxWeight;
            }
        }

        // Render the UI
        renderInventory();
        renderEquipment();
        renderHotkeys();
        renderBackpack();
        updateLimbHealth(state.limbHealth);
        updateWeight(state.weight, state.maxWeight);

        // Show container
        container.classList.remove('hidden');
        log('Inventory opened');
    }

    /**
     * Close the inventory UI
     */
    function closeInventory() {
        container.classList.add('hidden');
        hideTooltip();

        // Send close event to client
        postNUI('nuiClose', {});
        log('Inventory closed');
    }

    /**
     * Update inventory data and re-render
     */
    function updateInventory(payload) {
        if (payload.items) {
            state.inventory = payload.items;
            renderInventory();
        }
        if (payload.equipment) {
            state.equipment = payload.equipment;
            renderEquipment();
        }
        if (payload.hotkeys) {
            state.hotkeys = payload.hotkeys;
            renderHotkeys();
        }
        if (payload.backpack) {
            state.backpack = payload.backpack;
            renderBackpack();
        }
        if (payload.weight !== undefined || payload.maxWeight !== undefined) {
            updateWeight(payload.weight ?? state.weight, payload.maxWeight ?? state.maxWeight);
        }
    }

    /**
     * Render main inventory slots
     */
    function renderInventory() {
        const slots = mainInventory.querySelectorAll('.inventory-slot');
        
        slots.forEach((slot, index) => {
            const slotNum = index + 1;
            const item = state.inventory.find(i => i && i.slot === slotNum);
            
            renderSlotContent(slot, item);
        });

        // Update slot count
        const itemCount = state.inventory.filter(i => i && i.count > 0).length;
        document.querySelector('.inventory-section .slot-count').textContent = `(${itemCount}/${CONFIG.mainSlots})`;
    }

    /**
     * Render equipment slots
     */
    function renderEquipment() {
        Object.entries(state.equipment).forEach(([slotName, item]) => {
            const slot = document.querySelector(`.equipment-slot[data-slot="${slotName}"]`);
            if (slot) {
                if (item && item.name) {
                    slot.classList.add('has-item');
                    slot.dataset.item = JSON.stringify(item);
                } else {
                    slot.classList.remove('has-item');
                    delete slot.dataset.item;
                }
            }
        });
    }

    /**
     * Render hotkey slots
     */
    function renderHotkeys() {
        Object.entries(state.hotkeys).forEach(([slotName, item]) => {
            const slot = document.querySelector(`.hotkey-slot[data-slot="${slotName}"]`);
            if (slot) {
                if (item && item.name) {
                    slot.classList.add('has-item');
                    slot.dataset.item = JSON.stringify(item);
                    // Clear and add item image
                    slot.innerHTML = `<div class="hotkey-badge">${slotName.replace('hotkey', '')}</div>`;
                    if (item.name) {
                        const img = document.createElement('img');
                        img.className = 'item-image';
                        img.src = getItemImage(item.name);
                        img.alt = item.label || item.name;
                        img.onerror = () => img.style.display = 'none';
                        slot.insertBefore(img, slot.firstChild);
                    }
                } else {
                    slot.classList.remove('has-item');
                    delete slot.dataset.item;
                    slot.innerHTML = `<div class="hotkey-badge">${slotName.replace('hotkey', '')}</div>`;
                }
            }
        });
    }

    /**
     * Render backpack section
     */
    function renderBackpack() {
        if (state.backpack && state.backpack.slots > 0) {
            backpackSection.classList.remove('hidden');
            
            // Regenerate backpack slots if needed
            const currentSlots = backpackInventory.querySelectorAll('.inventory-slot').length;
            if (currentSlots !== state.backpack.slots) {
                generateSlots(backpackInventory, state.backpack.slots, 'backpack');
            }

            // Render items
            const slots = backpackInventory.querySelectorAll('.inventory-slot');
            slots.forEach((slot, index) => {
                const slotNum = index + 1;
                const item = state.backpack.items ? state.backpack.items.find(i => i && i.slot === slotNum) : null;
                renderSlotContent(slot, item);
            });

            // Update slot count
            const itemCount = state.backpack.items ? state.backpack.items.filter(i => i && i.count > 0).length : 0;
            document.querySelector('#backpack-section .slot-count').textContent = `(${itemCount}/${state.backpack.slots})`;
        } else {
            backpackSection.classList.add('hidden');
        }
    }

    /**
     * Render content for a single slot
     */
    function renderSlotContent(slot, item) {
        // Keep slot number
        const slotNumber = slot.querySelector('.slot-number');
        slot.innerHTML = '';
        if (slotNumber) {
            slot.appendChild(slotNumber);
        } else {
            const num = document.createElement('span');
            num.className = 'slot-number';
            num.textContent = slot.dataset.slot;
            slot.appendChild(num);
        }

        if (item && item.name && item.count > 0) {
            slot.classList.add('has-item');
            slot.dataset.item = JSON.stringify(item);

            // Item image
            const img = document.createElement('img');
            img.className = 'item-image';
            img.src = getItemImage(item.name);
            img.alt = item.label || item.name;
            img.draggable = false;
            img.onerror = () => {
                img.style.display = 'none';
                const placeholder = document.createElement('div');
                placeholder.style.cssText = 'color: rgba(255,255,255,0.5); font-size: 10px; text-align: center;';
                placeholder.textContent = item.name;
                slot.appendChild(placeholder);
            };
            slot.appendChild(img);

            // Item count
            if (item.count > 1) {
                const count = document.createElement('span');
                count.className = 'item-count';
                count.textContent = 'x' + item.count;
                slot.appendChild(count);
            }

            // Durability bar
            if (item.metadata && item.metadata.durability !== undefined) {
                const durabilityContainer = document.createElement('div');
                durabilityContainer.className = 'item-durability';
                const durabilityFill = document.createElement('div');
                durabilityFill.className = 'item-durability-fill';
                durabilityFill.style.width = Math.max(0, Math.min(100, item.metadata.durability)) + '%';
                durabilityContainer.appendChild(durabilityFill);
                slot.appendChild(durabilityContainer);
            }
        } else {
            slot.classList.remove('has-item');
            delete slot.dataset.item;
        }
    }

    /**
     * Update limb health display
     */
    function updateLimbHealth(limbHealth) {
        if (!limbHealth) return;

        state.limbHealth = { ...state.limbHealth, ...limbHealth };

        Object.entries(state.limbHealth).forEach(([part, health]) => {
            // Update body part SVG
            const bodyPart = document.querySelector(`.body-part[data-part="${part}"]`);
            if (bodyPart) {
                bodyPart.classList.remove('damaged', 'critical');
                if (health < 30) {
                    bodyPart.classList.add('critical');
                } else if (health < 70) {
                    bodyPart.classList.add('damaged');
                }
            }

            // Update health bar
            const barContainer = document.querySelector(`.health-bar-container[data-part="${part}"]`);
            if (barContainer) {
                const fill = barContainer.querySelector('.health-bar-fill');
                fill.style.width = health + '%';
                fill.classList.remove('medium', 'low');
                if (health < 30) {
                    fill.classList.add('low');
                } else if (health < 70) {
                    fill.classList.add('medium');
                }
            }
        });
    }

    /**
     * Update weight display
     */
    function updateWeight(weight, maxWeight) {
        state.weight = weight ?? state.weight;
        state.maxWeight = maxWeight ?? state.maxWeight;

        const currentEl = document.getElementById('weight-current');
        const maxEl = document.getElementById('weight-max');

        // Convert from grams to kg
        const weightKg = (state.weight / 1000).toFixed(2);
        const maxWeightKg = (state.maxWeight / 1000).toFixed(2);

        currentEl.textContent = weightKg;
        maxEl.textContent = maxWeightKg;

        // Change color based on weight percentage
        const percentage = (state.weight / state.maxWeight) * 100;
        if (percentage > 90) {
            currentEl.style.color = '#f44336';
        } else if (percentage > 70) {
            currentEl.style.color = '#FF9800';
        } else {
            currentEl.style.color = '#4CAF50';
        }
    }

    /**
     * Update a single slot
     */
    function updateSlot(slotNum, item, source = 'main') {
        let container;
        if (source === 'backpack') {
            container = backpackInventory;
        } else {
            container = mainInventory;
        }

        const slot = container.querySelector(`.inventory-slot[data-slot="${slotNum}"]`);
        if (slot) {
            renderSlotContent(slot, item);
        }
    }

    /**
     * Set mode (inventory/utility)
     */
    function setMode(mode) {
        document.querySelectorAll('.mode-btn').forEach(btn => btn.classList.remove('active'));
        document.getElementById('btn-' + mode).classList.add('active');
        log('Mode set to:', mode);
    }

    /**
     * Get item image URL
     */
    function getItemImage(itemName) {
        return `${CONFIG.imagePath}/${itemName}.png`;
    }

    // Drag & Drop Handlers
    function handleDragStart(e) {
        const item = e.target.dataset.item;
        if (!item) {
            e.preventDefault();
            return;
        }

        state.draggedItem = JSON.parse(item);
        state.draggedSlot = parseInt(e.target.dataset.slot);
        state.draggedSource = e.target.dataset.type;

        e.target.classList.add('dragging');
        e.dataTransfer.effectAllowed = 'move';
        e.dataTransfer.setData('text/plain', item);
        
        log('Drag started:', state.draggedSlot, state.draggedSource);
    }

    function handleDragEnd(e) {
        e.target.classList.remove('dragging');
        document.querySelectorAll('.drag-over').forEach(el => el.classList.remove('drag-over'));
        
        state.draggedItem = null;
        state.draggedSlot = null;
        state.draggedSource = null;
    }

    function handleDragOver(e) {
        e.preventDefault();
        e.dataTransfer.dropEffect = 'move';
    }

    function handleDragEnter(e) {
        e.preventDefault();
        e.target.closest('.inventory-slot, .equipment-slot, .hotkey-slot')?.classList.add('drag-over');
    }

    function handleDragLeave(e) {
        e.target.closest('.inventory-slot, .equipment-slot, .hotkey-slot')?.classList.remove('drag-over');
    }

    function handleDrop(e) {
        e.preventDefault();
        const target = e.target.closest('.inventory-slot');
        if (!target || !state.draggedItem) return;

        target.classList.remove('drag-over');

        const toSlot = parseInt(target.dataset.slot);
        const toSource = target.dataset.type;

        // Don't do anything if dropped on same slot
        if (toSlot === state.draggedSlot && toSource === state.draggedSource) {
            return;
        }

        // Send drag drop event to client
        postNUI('dragDrop', {
            fromSlot: state.draggedSlot,
            fromSource: state.draggedSource,
            toSlot: toSlot,
            toSource: toSource,
            item: state.draggedItem,
            count: state.draggedItem.count
        });

        log('Drop:', state.draggedSlot, '->', toSlot);
    }

    function handleEquipmentDrop(e) {
        e.preventDefault();
        const target = e.target.closest('.equipment-slot, .hotkey-slot');
        if (!target || !state.draggedItem) return;

        target.classList.remove('drag-over');

        const slotName = target.dataset.slot;

        // Send equip event to client
        postNUI('dragDrop', {
            fromSlot: state.draggedSlot,
            fromSource: state.draggedSource,
            toSlot: slotName,
            toSource: 'equipment',
            item: state.draggedItem,
            count: 1
        });

        log('Equipment drop:', slotName);
    }

    // Tooltip Handlers
    function handleSlotHover(e) {
        const slot = e.target.closest('.inventory-slot');
        if (!slot || !slot.dataset.item) return;

        const item = JSON.parse(slot.dataset.item);
        showTooltip(item, e);
    }

    function handleEquipmentHover(e) {
        const slot = e.target.closest('.equipment-slot, .hotkey-slot');
        if (!slot || !slot.dataset.item) return;

        const item = JSON.parse(slot.dataset.item);
        showTooltip(item, e);
    }

    function handleSlotLeave() {
        hideTooltip();
    }

    function showTooltip(item, e) {
        if (!item) return;

        document.querySelector('.tooltip-name').textContent = item.label || item.name;
        document.querySelector('.tooltip-count').textContent = 'x' + (item.count || 1);
        document.querySelector('.tooltip-description').textContent = item.description || 'No description available.';
        document.querySelector('.tooltip-weight').textContent = 'Weight: ' + ((item.weight || 0) / 1000).toFixed(2) + ' kg';

        // Metadata
        const metadataEl = document.querySelector('.tooltip-metadata');
        if (item.metadata && Object.keys(item.metadata).length > 0) {
            let metaHtml = '';
            for (const [key, value] of Object.entries(item.metadata)) {
                if (key !== 'durability' && value !== undefined && value !== null) {
                    metaHtml += `<div>${key}: ${value}</div>`;
                }
            }
            metadataEl.innerHTML = metaHtml;
        } else {
            metadataEl.innerHTML = '';
        }

        // Position tooltip
        tooltip.classList.remove('hidden');
        
        const rect = tooltip.getBoundingClientRect();
        let x = e.clientX + 15;
        let y = e.clientY + 15;

        if (x + rect.width > window.innerWidth) {
            x = e.clientX - rect.width - 15;
        }
        if (y + rect.height > window.innerHeight) {
            y = e.clientY - rect.height - 15;
        }

        tooltip.style.left = x + 'px';
        tooltip.style.top = y + 'px';
    }

    function hideTooltip() {
        tooltip.classList.add('hidden');
    }

    // Right-click handler
    function handleRightClick(e) {
        e.preventDefault();
        const slot = e.target.closest('.inventory-slot');
        if (!slot || !slot.dataset.item) return;

        const item = JSON.parse(slot.dataset.item);
        const slotNum = parseInt(slot.dataset.slot);

        // Send use item event
        postNUI('useItem', {
            slot: slotNum,
            item: item
        });

        log('Use item:', item.name);
    }

    // Keyboard handler
    function handleKeyDown(e) {
        // ESC to close
        if (e.key === 'Escape') {
            closeInventory();
            return;
        }

        // Number keys 1-5 for hotkeys (only when inventory is open)
        if (!container.classList.contains('hidden')) {
            const key = parseInt(e.key);
            if (key >= 1 && key <= 5) {
                postNUI('useHotkey', { key: key });
                log('Hotkey pressed:', key);
            }
        }
    }

    /**
     * Post message to NUI
     */
    function postNUI(event, data) {
        // Check if we're in FiveM environment
        if (typeof GetParentResourceName !== 'undefined') {
            fetch(`https://${GetParentResourceName()}/${event}`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            }).catch(err => log('NUI callback error:', err));
        } else {
            log('NUI callback (browser mode):', event, data);
        }
    }

    /**
     * Show preview (for development)
     */
    function showPreview() {
        // Sample data for preview
        const sampleItems = [
            { slot: 1, name: 'water', label: 'Water Bottle', count: 5, weight: 500, description: 'A refreshing bottle of water.' },
            { slot: 2, name: 'bread', label: 'Bread', count: 3, weight: 200, description: 'Fresh baked bread.' },
            { slot: 3, name: 'bandage', label: 'Bandage', count: 10, weight: 100, description: 'Medical bandage for treating wounds.', metadata: { durability: 100 } },
            { slot: 5, name: 'phone', label: 'Phone', count: 1, weight: 150, description: 'A smartphone.', metadata: { durability: 85 } },
            { slot: 8, name: 'lockpick', label: 'Lockpick', count: 2, weight: 50, description: 'Used to pick locks.', metadata: { durability: 45 } },
        ];

        const sampleHotkeys = {
            hotkey3: { name: 'medkit', label: 'Medkit', count: 1 },
            hotkey4: null,
            hotkey5: { name: 'armor', label: 'Body Armor', count: 1 }
        };

        const sampleLimbHealth = {
            head: 100,
            leftArm: 75,
            rightArm: 90,
            body: 85,
            leftLeg: 25,
            rightLeg: 60
        };

        openInventory({
            items: sampleItems,
            equipment: {},
            hotkeys: sampleHotkeys,
            backpack: { slots: 12, items: [] },
            limbHealth: sampleLimbHealth,
            weight: 15000,
            maxWeight: 30000
        });
    }

    /**
     * Debug logging
     */
    function log(...args) {
        if (CONFIG.debug || typeof GetParentResourceName === 'undefined') {
            console.log('[OX_NUI]', ...args);
        }
    }

    // Initialize on DOM ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
