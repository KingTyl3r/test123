/**
 * Modern NUI Inventory Script
 * Handles inventory rendering, drag/drop, tooltips, and NUI communication
 */

(function() {
    'use strict';

    // Configuration
    const Config = {
        defaultSlots: 24,          // 8x3 grid
        backpackSlots: 12,         // 4x3 grid for backpack
        imagePath: 'nui://ox_inventory/web/images/',
        defaultImage: 'box_small.png'
    };

    // State Management
    const State = {
        inventory: [],
        backpackInventory: [],
        equipmentSlots: {},
        hotkeySlots: {},
        health: {
            head: 100,
            leftArm: 100,
            rightArm: 100,
            body: 100,
            leftLeg: 100,
            rightLeg: 100
        },
        weight: 0,
        maxWeight: 30000,
        backpackWeight: 0,
        backpackMaxWeight: 0,
        hasBackpack: false,
        currentMode: 'inventory',
        draggedItem: null,
        draggedFrom: null,
        isOpen: false
    };

    // DOM Elements Cache
    const Elements = {};

    /**
     * Initialize DOM element references
     */
    function initElements() {
        Elements.container = document.getElementById('inventory-container');
        Elements.mainInventory = document.getElementById('main-inventory');
        Elements.backpackPanel = document.getElementById('backpack-panel');
        Elements.backpackInventory = document.getElementById('backpack-inventory');
        Elements.tooltip = document.getElementById('tooltip');
        Elements.dragPreview = document.getElementById('drag-preview');
        Elements.closeBtn = document.getElementById('close-btn');
        Elements.currentWeight = document.getElementById('current-weight');
        Elements.maxWeight = document.getElementById('max-weight');
        Elements.backpackCurrentWeight = document.getElementById('backpack-current-weight');
        Elements.backpackMaxWeight = document.getElementById('backpack-max-weight');
    }

    /**
     * Create inventory slot HTML
     * @param {number} index - Slot index
     * @param {string} type - Slot type ('main', 'backpack', 'equipment', 'hotkey')
     * @returns {HTMLElement} - Slot element
     */
    function createSlot(index, type = 'main') {
        const slot = document.createElement('div');
        slot.className = 'inventory-slot';
        slot.dataset.slot = index;
        slot.dataset.type = type;

        const slotNumber = document.createElement('span');
        slotNumber.className = 'slot-number';
        slotNumber.textContent = index + 1;
        slot.appendChild(slotNumber);

        // Add drag and drop events
        slot.addEventListener('dragover', handleDragOver);
        slot.addEventListener('dragleave', handleDragLeave);
        slot.addEventListener('drop', handleDrop);
        slot.addEventListener('mouseenter', handleMouseEnter);
        slot.addEventListener('mouseleave', handleMouseLeave);
        slot.addEventListener('contextmenu', handleContextMenu);
        slot.addEventListener('dblclick', handleDoubleClick);

        return slot;
    }

    /**
     * Generate inventory grid
     * @param {HTMLElement} container - Grid container element
     * @param {number} slots - Number of slots to create
     * @param {string} type - Slot type
     */
    function generateGrid(container, slots, type) {
        container.innerHTML = '';
        for (let i = 0; i < slots; i++) {
            container.appendChild(createSlot(i, type));
        }
    }

    /**
     * Render item in slot
     * @param {HTMLElement} slot - Slot element
     * @param {Object|null} item - Item data
     */
    function renderItemInSlot(slot, item) {
        // Clear existing content except slot number
        const slotNumber = slot.querySelector('.slot-number');
        slot.innerHTML = '';
        if (slotNumber) {
            slot.appendChild(slotNumber);
        }

        if (!item || !item.name) {
            slot.draggable = false;
            slot.classList.remove('has-item');
            return;
        }

        slot.classList.add('has-item');
        slot.draggable = true;
        slot.dataset.itemName = item.name;

        // Item image
        const img = document.createElement('img');
        img.className = 'item-image';
        img.src = getItemImagePath(item.name);
        img.alt = item.label || item.name;
        img.onerror = function() {
            this.src = Config.imagePath + Config.defaultImage;
        };
        slot.appendChild(img);

        // Item count
        if (item.count && item.count > 1) {
            const count = document.createElement('span');
            count.className = 'item-count';
            count.textContent = 'x' + item.count;
            slot.appendChild(count);
        }

        // Durability bar
        if (item.metadata && typeof item.metadata.durability === 'number') {
            const durabilityContainer = document.createElement('div');
            durabilityContainer.className = 'item-durability';
            const durabilityFill = document.createElement('div');
            durabilityFill.className = 'item-durability-fill';
            durabilityFill.style.width = item.metadata.durability + '%';

            // Color based on durability
            if (item.metadata.durability <= 25) {
                durabilityFill.style.background = 'var(--health-red)';
            } else if (item.metadata.durability <= 50) {
                durabilityFill.style.background = 'var(--health-yellow)';
            }

            durabilityContainer.appendChild(durabilityFill);
            slot.appendChild(durabilityContainer);
        }

        // Drag start event
        slot.addEventListener('dragstart', handleDragStart);
        slot.addEventListener('dragend', handleDragEnd);
    }

    /**
     * Get item image path
     * @param {string} itemName - Item name
     * @returns {string} - Image URL
     */
    function getItemImagePath(itemName) {
        return Config.imagePath + itemName.toLowerCase() + '.png';
    }

    /**
     * Update entire inventory display
     */
    function updateInventoryDisplay() {
        // Update main inventory
        const mainSlots = Elements.mainInventory.querySelectorAll('.inventory-slot');
        mainSlots.forEach((slot, index) => {
            renderItemInSlot(slot, State.inventory[index] || null);
        });

        // Update backpack inventory if visible
        if (State.hasBackpack) {
            const backpackSlots = Elements.backpackInventory.querySelectorAll('.inventory-slot');
            backpackSlots.forEach((slot, index) => {
                renderItemInSlot(slot, State.backpackInventory[index] || null);
            });
        }

        // Update equipment slots
        updateEquipmentSlots();

        // Update hotkey slots
        updateHotkeySlots();

        // Update weight display
        updateWeightDisplay();
    }

    /**
     * Update equipment slot displays
     */
    function updateEquipmentSlots() {
        const equipmentSlots = document.querySelectorAll('.equipment-slot');
        equipmentSlots.forEach(slot => {
            const slotName = slot.dataset.slot;
            const item = State.equipmentSlots[slotName];
            const iconContainer = slot.querySelector('.slot-icon');

            // Clear existing item
            iconContainer.innerHTML = '';

            if (item && item.name) {
                slot.classList.add('has-item');
                const img = document.createElement('img');
                img.src = getItemImagePath(item.name);
                img.alt = item.label || item.name;
                img.onerror = function() {
                    this.src = Config.imagePath + Config.defaultImage;
                };
                iconContainer.appendChild(img);
            } else {
                slot.classList.remove('has-item');
            }
        });
    }

    /**
     * Update hotkey slot displays
     */
    function updateHotkeySlots() {
        const hotkeySlots = document.querySelectorAll('.hotkey-slot');
        hotkeySlots.forEach(slot => {
            const slotName = slot.dataset.slot;
            const item = State.hotkeySlots[slotName];

            // Remove existing item image
            const existingImg = slot.querySelector('img');
            if (existingImg) {
                existingImg.remove();
            }

            if (item && item.name) {
                slot.classList.add('has-item');
                const img = document.createElement('img');
                img.src = getItemImagePath(item.name);
                img.alt = item.label || item.name;
                img.onerror = function() {
                    this.src = Config.imagePath + Config.defaultImage;
                };
                slot.appendChild(img);
            } else {
                slot.classList.remove('has-item');
            }
        });
    }

    /**
     * Update weight display
     */
    function updateWeightDisplay() {
        if (Elements.currentWeight) {
            Elements.currentWeight.textContent = formatWeight(State.weight);
        }
        if (Elements.maxWeight) {
            Elements.maxWeight.textContent = formatWeight(State.maxWeight);
        }
        if (State.hasBackpack) {
            if (Elements.backpackCurrentWeight) {
                Elements.backpackCurrentWeight.textContent = formatWeight(State.backpackWeight);
            }
            if (Elements.backpackMaxWeight) {
                Elements.backpackMaxWeight.textContent = formatWeight(State.backpackMaxWeight);
            }
        }
    }

    /**
     * Format weight for display
     * @param {number} weight - Weight in grams
     * @returns {string} - Formatted weight
     */
    function formatWeight(weight) {
        if (weight >= 1000) {
            return (weight / 1000).toFixed(1) + 'kg';
        }
        return weight + 'g';
    }

    /**
     * Update health display
     * @param {Object} healthData - Health data for each body part
     */
    function updateHealthDisplay(healthData) {
        if (!healthData) return;

        Object.assign(State.health, healthData);

        // Update body part colors
        const bodyParts = document.querySelectorAll('.body-part');
        bodyParts.forEach(part => {
            const partName = part.dataset.part;
            const health = State.health[partName] || 100;

            part.classList.remove('healthy', 'damaged', 'critical');

            if (health > 66) {
                part.classList.add('healthy');
            } else if (health > 33) {
                part.classList.add('damaged');
            } else {
                part.classList.add('critical');
            }
        });

        // Update health bars
        const healthBars = document.querySelectorAll('.health-bar');
        healthBars.forEach(bar => {
            const partName = bar.dataset.part;
            const health = State.health[partName] || 100;
            const fill = bar.querySelector('.health-fill');

            if (fill) {
                fill.style.width = health + '%';

                bar.removeAttribute('data-health');
                if (health <= 33) {
                    bar.setAttribute('data-health', 'low');
                } else if (health <= 66) {
                    bar.setAttribute('data-health', 'medium');
                }
            }
        });
    }

    // Drag and Drop Handlers

    function handleDragStart(e) {
        const slot = e.target.closest('.inventory-slot');
        if (!slot || !slot.classList.contains('has-item')) {
            e.preventDefault();
            return;
        }

        const slotIndex = parseInt(slot.dataset.slot);
        const slotType = slot.dataset.type;

        let item;
        if (slotType === 'main') {
            item = State.inventory[slotIndex];
        } else if (slotType === 'backpack') {
            item = State.backpackInventory[slotIndex];
        }

        if (!item) {
            e.preventDefault();
            return;
        }

        State.draggedItem = item;
        State.draggedFrom = { slot: slotIndex, type: slotType };

        // Set drag image
        const dragImg = slot.querySelector('.item-image');
        if (dragImg) {
            e.dataTransfer.setDragImage(dragImg, 25, 25);
        }

        e.dataTransfer.effectAllowed = 'move';
        slot.classList.add('selected');

        // Show drag preview
        updateDragPreview(item, e.clientX, e.clientY);
    }

    function handleDragEnd(e) {
        const slots = document.querySelectorAll('.inventory-slot');
        slots.forEach(s => {
            s.classList.remove('selected', 'dragover');
        });

        hideDragPreview();
        State.draggedItem = null;
        State.draggedFrom = null;
    }

    function handleDragOver(e) {
        e.preventDefault();
        e.dataTransfer.dropEffect = 'move';
        e.target.closest('.inventory-slot')?.classList.add('dragover');
    }

    function handleDragLeave(e) {
        e.target.closest('.inventory-slot')?.classList.remove('dragover');
    }

    function handleDrop(e) {
        e.preventDefault();
        const targetSlot = e.target.closest('.inventory-slot');
        if (!targetSlot) return;

        targetSlot.classList.remove('dragover');

        if (!State.draggedItem || !State.draggedFrom) return;

        const toSlot = parseInt(targetSlot.dataset.slot);
        const toType = targetSlot.dataset.type;

        // Send drag drop event to client
        postNUICallback('dragDrop', {
            fromSlot: State.draggedFrom.slot,
            fromType: State.draggedFrom.type,
            toSlot: toSlot,
            toType: toType,
            item: State.draggedItem.name,
            count: State.draggedItem.count || 1
        });

        State.draggedItem = null;
        State.draggedFrom = null;
    }

    // Drag Preview
    function updateDragPreview(item, x, y) {
        if (!Elements.dragPreview) return;

        const img = Elements.dragPreview.querySelector('.drag-image');
        const count = Elements.dragPreview.querySelector('.drag-count');

        img.src = getItemImagePath(item.name);
        count.textContent = item.count > 1 ? 'x' + item.count : '';

        Elements.dragPreview.style.left = (x + 10) + 'px';
        Elements.dragPreview.style.top = (y + 10) + 'px';
        Elements.dragPreview.classList.remove('hidden');
    }

    function hideDragPreview() {
        if (Elements.dragPreview) {
            Elements.dragPreview.classList.add('hidden');
        }
    }

    // Tooltip Handlers

    function handleMouseEnter(e) {
        const slot = e.target.closest('.inventory-slot');
        if (!slot || !slot.classList.contains('has-item')) return;

        const slotIndex = parseInt(slot.dataset.slot);
        const slotType = slot.dataset.type;

        let item;
        if (slotType === 'main') {
            item = State.inventory[slotIndex];
        } else if (slotType === 'backpack') {
            item = State.backpackInventory[slotIndex];
        }

        if (item) {
            showTooltip(item, e.clientX, e.clientY);
        }
    }

    function handleMouseLeave() {
        hideTooltip();
    }

    function showTooltip(item, x, y) {
        if (!Elements.tooltip || !item) return;

        const nameEl = Elements.tooltip.querySelector('.tooltip-name');
        const countEl = Elements.tooltip.querySelector('.tooltip-count');
        const descEl = Elements.tooltip.querySelector('.tooltip-description');
        const weightEl = Elements.tooltip.querySelector('.tooltip-weight');
        const metaEl = Elements.tooltip.querySelector('.tooltip-metadata');

        nameEl.textContent = item.label || item.name;
        countEl.textContent = item.count > 1 ? 'x' + item.count : '';
        descEl.textContent = item.description || '';
        weightEl.textContent = item.weight ? 'Weight: ' + formatWeight(item.weight * (item.count || 1)) : '';

        // Metadata
        metaEl.innerHTML = '';
        if (item.metadata) {
            if (typeof item.metadata.durability === 'number') {
                metaEl.innerHTML += '<div>Durability: <span>' + item.metadata.durability + '%</span></div>';
            }
            if (item.metadata.serial) {
                metaEl.innerHTML += '<div>Serial: <span>' + item.metadata.serial + '</span></div>';
            }
            if (item.metadata.ammo !== undefined) {
                metaEl.innerHTML += '<div>Ammo: <span>' + item.metadata.ammo + '</span></div>';
            }
        }

        // Position tooltip
        const viewportWidth = window.innerWidth;
        const viewportHeight = window.innerHeight;
        const tooltipRect = Elements.tooltip.getBoundingClientRect();

        let posX = x + 15;
        let posY = y + 15;

        // Adjust if tooltip goes off screen
        if (posX + tooltipRect.width > viewportWidth) {
            posX = x - tooltipRect.width - 15;
        }
        if (posY + tooltipRect.height > viewportHeight) {
            posY = y - tooltipRect.height - 15;
        }

        Elements.tooltip.style.left = posX + 'px';
        Elements.tooltip.style.top = posY + 'px';
        Elements.tooltip.classList.remove('hidden');
    }

    function hideTooltip() {
        if (Elements.tooltip) {
            Elements.tooltip.classList.add('hidden');
        }
    }

    // Context Menu

    function handleContextMenu(e) {
        e.preventDefault();
        const slot = e.target.closest('.inventory-slot');
        if (!slot || !slot.classList.contains('has-item')) return;

        const slotIndex = parseInt(slot.dataset.slot);
        const slotType = slot.dataset.type;

        let item;
        if (slotType === 'main') {
            item = State.inventory[slotIndex];
        } else if (slotType === 'backpack') {
            item = State.backpackInventory[slotIndex];
        }

        if (item) {
            showContextMenu(item, slotIndex, slotType, e.clientX, e.clientY);
        }
    }

    function showContextMenu(item, slot, type, x, y) {
        // Remove existing context menu
        const existingMenu = document.querySelector('.context-menu');
        if (existingMenu) {
            existingMenu.remove();
        }

        const menu = document.createElement('div');
        menu.className = 'context-menu';

        // Use item option
        const useOption = document.createElement('div');
        useOption.className = 'context-menu-item';
        useOption.textContent = 'Use';
        useOption.onclick = () => {
            postNUICallback('useItem', { slot: slot, type: type });
            menu.remove();
        };
        menu.appendChild(useOption);

        // Drop item option
        const dropOption = document.createElement('div');
        dropOption.className = 'context-menu-item danger';
        dropOption.textContent = 'Drop';
        dropOption.onclick = () => {
            postNUICallback('dropItem', { slot: slot, type: type, count: item.count || 1 });
            menu.remove();
        };
        menu.appendChild(dropOption);

        // Position menu
        menu.style.left = x + 'px';
        menu.style.top = y + 'px';

        document.body.appendChild(menu);

        // Close menu on click outside
        const closeMenu = (e) => {
            if (!menu.contains(e.target)) {
                menu.remove();
                document.removeEventListener('click', closeMenu);
            }
        };
        setTimeout(() => document.addEventListener('click', closeMenu), 0);
    }

    // Double click to use item
    function handleDoubleClick(e) {
        const slot = e.target.closest('.inventory-slot');
        if (!slot || !slot.classList.contains('has-item')) return;

        const slotIndex = parseInt(slot.dataset.slot);
        const slotType = slot.dataset.type;

        postNUICallback('useItem', { slot: slotIndex, type: slotType });
    }

    // Mode Toggle
    function initModeToggle() {
        const modeButtons = document.querySelectorAll('.mode-btn');
        modeButtons.forEach(btn => {
            btn.addEventListener('click', () => {
                const mode = btn.dataset.mode;
                if (mode === State.currentMode) return;

                modeButtons.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
                State.currentMode = mode;

                // Toggle utility mode class on container
                if (mode === 'utility') {
                    Elements.container.classList.add('utility-mode');
                } else {
                    Elements.container.classList.remove('utility-mode');
                }

                postNUICallback('modeChanged', { mode: mode });
            });
        });
    }

    // Close Button
    function initCloseButton() {
        if (Elements.closeBtn) {
            Elements.closeBtn.addEventListener('click', closeInventory);
        }
    }

    // Keyboard Shortcuts
    function initKeyboardShortcuts() {
        document.addEventListener('keydown', (e) => {
            if (!State.isOpen) return;

            // ESC to close
            if (e.key === 'Escape') {
                closeInventory();
                return;
            }

            // Number keys for hotkeys (only when inventory is open)
            // Keys 1-5 are handled by client-side keymappings for instant use
        });
    }

    // NUI Communication

    /**
     * Post NUI callback to client
     * @param {string} event - Event name
     * @param {Object} data - Event data
     */
    function postNUICallback(event, data) {
        fetch('https://ox_inventory/' + event, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8'
            },
            body: JSON.stringify(data)
        }).catch(() => {
            // Silently catch errors in dev environment
        });
    }

    /**
     * Open inventory
     */
    function openInventory() {
        State.isOpen = true;
        Elements.container.classList.remove('hidden');
        generateGrid(Elements.mainInventory, Config.defaultSlots, 'main');
        updateInventoryDisplay();
    }

    /**
     * Close inventory
     */
    function closeInventory() {
        State.isOpen = false;
        Elements.container.classList.add('hidden');
        hideTooltip();
        hideDragPreview();

        // Remove any context menus
        const contextMenu = document.querySelector('.context-menu');
        if (contextMenu) {
            contextMenu.remove();
        }

        postNUICallback('nuiClose', {});
    }

    /**
     * Show/hide backpack panel
     * @param {boolean} show - Whether to show backpack
     * @param {number} slots - Number of backpack slots
     * @param {number} maxWeight - Backpack max weight
     */
    function setBackpackVisible(show, slots, maxWeight) {
        State.hasBackpack = show;
        State.backpackMaxWeight = maxWeight || 10000;

        if (show) {
            Elements.backpackPanel.classList.remove('hidden');
            generateGrid(Elements.backpackInventory, slots || Config.backpackSlots, 'backpack');
        } else {
            Elements.backpackPanel.classList.add('hidden');
        }
    }

    // NUI Message Handler
    window.addEventListener('message', (event) => {
        const data = event.data;

        switch (data.action) {
            case 'openInventory':
                // Set inventory data
                if (data.inventory) {
                    State.inventory = data.inventory;
                }
                if (data.weight !== undefined) {
                    State.weight = data.weight;
                }
                if (data.maxWeight !== undefined) {
                    State.maxWeight = data.maxWeight;
                }
                if (data.slots !== undefined) {
                    Config.defaultSlots = data.slots;
                }
                if (data.imagePath) {
                    Config.imagePath = data.imagePath;
                }

                // Handle backpack
                if (data.backpack && data.backpack.enabled) {
                    setBackpackVisible(true, data.backpack.slots, data.backpack.maxWeight);
                    State.backpackInventory = data.backpack.inventory || [];
                    State.backpackWeight = data.backpack.weight || 0;
                } else {
                    setBackpackVisible(false);
                }

                // Equipment slots
                if (data.equipment) {
                    State.equipmentSlots = data.equipment;
                }

                // Hotkey slots
                if (data.hotkeys) {
                    State.hotkeySlots = data.hotkeys;
                }

                // Health data
                if (data.health) {
                    updateHealthDisplay(data.health);
                }

                openInventory();
                break;

            case 'closeInventory':
                closeInventory();
                break;

            case 'updateInventory':
                // Update inventory items
                if (data.inventory) {
                    State.inventory = data.inventory;
                }
                if (data.weight !== undefined) {
                    State.weight = data.weight;
                }
                if (data.backpackInventory) {
                    State.backpackInventory = data.backpackInventory;
                }
                if (data.backpackWeight !== undefined) {
                    State.backpackWeight = data.backpackWeight;
                }
                if (data.equipment) {
                    State.equipmentSlots = data.equipment;
                }
                if (data.hotkeys) {
                    State.hotkeySlots = data.hotkeys;
                }

                updateInventoryDisplay();
                break;

            case 'updateHealth':
                updateHealthDisplay(data.health);
                break;

            case 'updateSlot':
                // Update a single slot
                const slotIndex = data.slot;
                const slotType = data.type || 'main';
                const itemData = data.item;

                if (slotType === 'main') {
                    State.inventory[slotIndex] = itemData;
                } else if (slotType === 'backpack') {
                    State.backpackInventory[slotIndex] = itemData;
                }

                updateInventoryDisplay();
                break;

            case 'setBackpack':
                setBackpackVisible(data.enabled, data.slots, data.maxWeight);
                if (data.inventory) {
                    State.backpackInventory = data.inventory;
                }
                if (data.weight !== undefined) {
                    State.backpackWeight = data.weight;
                }
                updateInventoryDisplay();
                break;
        }
    });

    // Mouse move for drag preview
    document.addEventListener('mousemove', (e) => {
        if (State.draggedItem) {
            updateDragPreview(State.draggedItem, e.clientX, e.clientY);
        }
    });

    // Initialize on DOM ready
    document.addEventListener('DOMContentLoaded', () => {
        initElements();
        initModeToggle();
        initCloseButton();
        initKeyboardShortcuts();

        // Generate initial grid
        generateGrid(Elements.mainInventory, Config.defaultSlots, 'main');

        // Debug: Preview mode for development
        // To test in browser, uncomment the following:
        /*
        window.previewInventory = function() {
            window.postMessage({
                action: 'openInventory',
                inventory: [
                    { name: 'water', label: 'Water Bottle', count: 5, weight: 500, description: 'A bottle of fresh water' },
                    { name: 'bread', label: 'Bread', count: 2, weight: 200 },
                    null,
                    { name: 'bandage', label: 'Bandage', count: 10, weight: 50, metadata: { durability: 75 } },
                ],
                weight: 2500,
                maxWeight: 30000,
                slots: 24,
                equipment: {
                    weapon1: { name: 'WEAPON_PISTOL', label: 'Pistol' }
                },
                health: {
                    head: 100,
                    leftArm: 80,
                    rightArm: 100,
                    body: 90,
                    leftLeg: 50,
                    rightLeg: 100
                }
            }, '*');
        };
        */
    });
})();
