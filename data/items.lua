return {
	['sandwich'] = { -- A simple sandwich for a simple day
        label = 'Sandwich',
        weight = 350,
        stack = true,
        close = true,
        description = "A simple sandwich for a simple day",
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_sandwich_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

    ['burger'] = { -- A test hamburger that you can eat
        label = 'Hamburger',
        weight = 350,
        stack = true,
        close = true,
        description = "A test hamburger that you can eat",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_burger_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

    ['burger_chs'] = { -- A test hamburger that you can eat
        label = 'Cheese Burger',
        weight = 350,
        stack = true,
        close = true,
        description = "A test hamburger that you can eat, with cheese",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_burger_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

    ['burger_chsbcn'] = { -- A test hamburger that you can eat
        label = 'Bacon Cheese Burger',
        weight = 350,
        stack = true,
        close = true,
        description = "A test hamburger that you can eat, with cheese & bacon",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_burger_01', 
            pos = vec3(0.05, -0.02, -0.03), rot = vec3(150.0, 340.0, 170.0) },
            usetime = 7500,
        },
    },

    ['hotdog'] = { -- A test hamburger that you can eat
        label = 'Hotdog',
        weight = 350,
        stack = true,
        close = true,
        description = "Not made with real dogs or meat",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'prop_cs_hotdog_01', 
            pos = vec3(0.06, -0.01, -0.03), rot = vec3(60.0, -90.0, 0.0) },
            usetime = 7500,
        },
    },

    ['noodles'] = { -- Fuck those baked shits are good af
        label = 'Thai Noodles',
        weight = 350,
        stack = true,
        close = true,
        description = "นี่คือบะหมี่",
        client = {
            status = { hunger = 230000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_ret_fh_noodle', 
            pos = vec3(-0.03, 0.01, 0.05), 
            rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['fr_fries'] = { -- A test hamburger that you can eat
        label = 'French Fries',
        weight = 350,
        stack = true,
        close = true,
        description = "Rib flavored chips, made with real wood chips",
        client = {
            status = { hunger = 180000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_food_chips', 
            pos = vec3(-0.01, 0.0, -0.02), rot = vec3(0.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },


    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- FOOD: Pizzas


    ['pizza_pep'] = { -- A simple sandwich for a simple day
        label = 'Peperoni Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "Who put cheese on my pepperoni",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice5', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

    ['pizza_chs'] = { -- A simple sandwich for a simple day
        label = 'Cheese Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "Is it enough cheese? No",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice4', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

    ['pizza_msh'] = { -- A simple sandwich for a simple day
        label = 'Mushroom Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "Fungi on my pizza? Who thought of this?",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice3', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

    ['pizza_mgt'] = { -- A simple sandwich for a simple day
        label = 'Margherita Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "I know, I thought it was alcohol pizza too",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice2', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },

    ['pizza_dmt'] = { -- A simple sandwich for a simple day
        label = 'Double Meat Pizza',
        weight = 350,
        stack = true,
        close = true,
        description = "When one meat isn't enough and 3 is weird",
        client = {
            status = { hunger = 330000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'knjgh_pizzaslice1', 
            pos = vec3(0.0500, -0.0300, -0.0700), 
            rot = vec3(300.0, -10.0, 160.0),
            bone = 60309 },
            usetime = 7500,
        },
    },


    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- FOOD: Snacks


    ['phatc_rib'] = { -- A skeletons favorite snack
        label = 'Phat Chips: Ribs',
        weight = 350,
        stack = true,
        close = true,
        description = "Rib flavored chips, made with real wood chips",
        client = {
            status = { hunger = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_food_chips01b', 
            pos = vec3(0.0, 0.08, 0.05), rot = vec3(90.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },

    ['phatc_bch'] = { -- Biggie Cheese
        label = 'Phat Chips: Big Cheese',
        weight = 350,
        stack = true,
        close = true,
        description = "Cheese flavored chips, made with real rats",
        client = {
            status = { hunger = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_food_chips01a', 
            pos = vec3(0.0, 0.08, 0.05), rot = vec3(90.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },

    ['ps_qs'] = { -- is that candy
        label = 'P\'s & Q\'s',
        weight = 350,
        stack = true,
        close = true,
        description = "Candy make your tongue go brrrr",
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_candy_pqs', 
            pos = vec3(0.0, 0.02, 0.05), rot = vec3(90.0, 0.0, -45.0) },
            usetime = 5000,
        },
    },

    ['apple'] = { -- Apple good
        label = 'Apple',
        weight = 350,
        stack = true,
        close = true,
        description = "Yes, from the trees comes deez apples",
        client = {
            status = { hunger = 90000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'sf_prop_sf_apple_01a', 
            pos = vec3(0.03, -0.02, -0.03), rot = vec3(300.0, 340.0, 170.0) },
            usetime = 3000,
        },
    },

    ['banana'] = { -- banana good
        label = 'Banana',
        weight = 350,
        stack = true,
        close = true,
        description = "b a n a n a n a n a n a",
        client = {
            status = { hunger = 90000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'v_res_tre_banana', 
            pos = vec3(0.05, -0.02, 0.01), rot = vec3(270.0, 90.0, 0.0) },
            usetime = 3000,
        },
    },
    

    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- FOOD: Deserts

    ['donut_chc'] = { -- Fuck those baked shits are good af
        label = 'Chocolate Donut',
        weight = 350,
        stack = true,
        close = true,
        description = "Mmmmm, refrence",
        client = {
            status = { hunger = 150000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_foodpack_donut002', 
            bone = 18905,
            pos = vec3(0.13, 0.050, 0.020), 
            rot = vec3(-50.0, 100.0, 270.0) },
            usetime = 7500,
        },
    },

    ['donut_sby'] = { -- Fuck those baked shits are good af
        label = 'Strawberry Donut',
        weight = 350,
        stack = true,
        close = true,
        description = "Mmmmm, refrence",
        client = {
            status = { hunger = 150000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_foodpack_donut001', 
            bone = 18905,
            pos = vec3(0.13, 0.050, 0.020), 
            rot = vec3(-50.0, 100.0, 270.0) },
            usetime = 7500,
        },
    },

    ['smore'] = { -- Fuck those baked shits are good af
        label = 'Smore',
        weight = 350,
        stack = true,
        close = true,
        description = "Mmmmm, refrence",
        client = {
            status = { hunger = 90000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_food_dessert_a', 
            bone = 18905,
            pos = vec3(0.15, 0.03, 0.03), 
            rot = vec3(-42.0, -36.0, 0.0) },
            usetime = 7500,
        },
    },

    ['icecream_chr'] = { -- brain cold go brrrrr
        label = 'Cherry Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_cherry', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_chc'] = { -- brain cold go brrrrr
        label = 'Chocolate Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_chocolate', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_lmn'] = { -- brain cold go brrrrr
        label = 'Lemon Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_lemon', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_pso'] = { -- brain cold go brrrrr
        label = 'Pistachio Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_pistachio', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_rpy'] = { -- brain cold go brrrrr
        label = 'Raspberry Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_raspberry', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_ckd'] = { -- brain cold go brrrrr
        label = 'Cookie Dough Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_stracciatella', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_sby'] = { -- brain cold go brrrrr
        label = 'Strawberry Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_strawberry', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },

    ['icecream_vna'] = { -- brain cold go brrrrr
        label = 'Vanilla Ice Cream',
        weight = 350,
        stack = true,
        close = true,
        description = "Why yes, your brain is freezing",
        client = {
            status = { hunger = 50000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'bzzz_icecream_walnut', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },








    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- DRINKS: General

    ['water'] = { -- Carbonized syrup is good for the soul
        label = 'Water Bottle',
        weight = 350,
        stack = true,
        close = true,
        description = "If you think you need more, you do",
        client = {
            status = { thirst = 330000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'vw_prop_casino_water_bottle_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['milk'] = { -- milky milky milky
        label = 'Milk Carton',
        weight = 350,
        stack = true,
        close = true,
        description = "You need strong bones for crimes",
        client = {
            status = { thirst = 330000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_tt_milk', 
            bone = 18905,
            pos = vec3(0.10, 0.008, 0.070), 
            rot = vec3(240.0, -60.0, 0.0) },
            usetime = 7500,
        },
    },


    -- COFFEES


    ['coffee_black'] = { -- Carbonized syrup is good for the soul
        label = 'Black Coffee',
        weight = 350,
        stack = true,
        close = true,
        description = "As black as the color wheel lets it be",
        client = {
            status = { thirst = 280000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['coffee_mocha'] = { -- Carbonized syrup is good for the soul
        label = 'Mocha',
        weight = 350,
        stack = true,
        close = true,
        description = "What even is a mocha",
        client = {
            status = { thirst = 280000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['coffee_cpcno'] = { -- Carbonized syrup is good for the soul
        label = 'Cappuccino',
        weight = 350,
        stack = true,
        close = true,
        description = "That might wake you up a smidge",
        client = {
            status = { thirst = 280000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },

    ['coffee_amrcno'] = { -- Carbonized syrup is good for the soul
        label = 'Americano',
        weight = 350,
        stack = true,
        close = true,
        description = "American coffee, with an o",
        client = {
            status = { thirst = 280000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_coffee_01a', 
            pos = vec3(0.008, 0.0, -0.05), rot = vec3(0.0, 0.0, -40.0) },
            usetime = 7500,
        },
    },


    -- SODAS


    ['ecola'] = { -- Carbonized syrup is good for the soul
        label = 'eCola',
        weight = 350,
        stack = true,
        close = true,
        description = "Hey, there is soda in my cocaine",
        client = {
            status = { thirst = 210000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_ecola_can', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 130.0) },
            usetime = 5000,
        },
    },

    ['sprunk'] = { -- Carbonized syrup is good for the soul
        label = 'Sprunk',
        weight = 350,
        stack = true,
        close = true,
        description = "It tastes like water punched you in the throat",
        client = {
            status = { thirst = 210000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'ng_proc_sodacan_01b', 
            pos = vec3(0.005, -0.001, 0.08), rot = vec3(0.0, 0.0, 160.0) },
            usetime = 5000,
        },
    },

    ['orangotang'] = { -- Carbonized syrup is good for the soul
        label = 'Orang-o-tang',
        weight = 350,
        stack = true,
        close = true,
        description = "I didn't even know people wanted this",
        client = {
            status = { thirst = 210000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_orang_can_01', 
            pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 130.0) },
            usetime = 5000,
        },
    },

    ['ejunk'] = { -- Drinking too much of this wont kill you. I think.
        label = 'Junk Energy',
        weight = 350,
        stack = true,
        close = true,
        description = "Drinking too much of this wont kill you. I think.",
        client = {
            status = { thirst = 210000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'sf_prop_sf_can_01a', 
            pos = vec3(0.025, 0.010, 0.05), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 5000,
        },
    },










    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- ALCOHOL: Beers
    ['rancho_beer'] = { -- Good ol imported beer from mexico
        label = 'Cerbesa Barracho',
        weight = 290,
        stack = true,
        close = true,
        description = "Good ol imported beer from mexico",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_beer_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['dusche_beer'] = { -- Good ol imported beer from germany
        label = 'Dusche Beer',
        weight = 290,
        stack = true,
        close = true,
        description = "Good ol imported beer from germany",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_beerdusche', 
            pos = vec3(0.01, -0.01, -0.12), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 7500,
        },
    },

    ['blarny_beer'] = { -- Good ol imported beer from italy
        label = 'Blarny\'s Stout',
        weight = 290,
        stack = true,
        close = true,
        description = "Good ol imported stout from ireland",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_beer_blr', 
            pos = vec3(0.01, -0.02, -0.15), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 7500,
        },
    },

    ['patriot_beer'] = { -- Good ol homemade beer from the brewery
        label = 'Patriot Beer',
        weight = 290,
        stack = true,
        close = true,
        description = "Good ol homemade beer from the brewery",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_beer_patriot', 
            pos = vec3(0.01, -0.02, -0.15), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 7500,
        },
    },










    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- ALCOHOL: Bottles
    ['bb_bourgeoix'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Bourgeoix Cognac',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_bottle_cognac', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['bb_cariaque'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Cariaque Bourbon',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_bottle_brandy', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['cb_bleuterd'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Bleuter\'d Champagne',
        weight = 290,
        stack = true,
        close = true,
        description = "For those fancy events",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_champ_01b', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['rb_ragga'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Ragga Rum',
        weight = 290,
        stack = true,
        close = true,
        description = "A pirates drink for me",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_rum_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['tb_tequilya'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Tequilya Tequila',
        weight = 290,
        stack = true,
        close = true,
        description = "For extra kick, add snake venom",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_tequila_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['vb_nogo'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Nogo Vodka',
        weight = 290,
        stack = true,
        close = true,
        description = "Chilled like the mountains of Siberia",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_vodka_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['wb_mount'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Mount Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "The cowboy's choice for getting plastered",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_cs_whiskey_bottle', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['wb_richards'] = { -- Good ol imported beer from mexico
        label = 'Bottle of Richard\'s Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "For the refined taste buds you so clearly have",
        client = {
            status = { drunk = 450000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'prop_bottle_richard', 
            pos = vec3(0.02, -0.01, -0.14), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },










    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- ALCOHOL: Glasses
    ['bg_bourgeiox'] = { -- Good ol imported beer from mexico
        label = 'Glass of Bourgeoix Cognac',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 70000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['bg_cariaque'] = { -- Good ol imported beer from mexico
        label = 'Glass of Cariaque Bourbon',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 70000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['bs_bourgeiox'] = { -- Good ol imported beer from mexico
        label = 'Shot of Bourgeoix Cognac',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['bs_cariaque'] = { -- Good ol imported beer from mexico
        label = 'Shot of Cariaque Bourbon',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['cg_bleuterd'] = { -- Good ol imported beer from mexico
        label = 'Glass of Bleuter\'d Champagne',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 70000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_champ', 
            pos = vec3(0.16, -0.19, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['tg_martini'] = { -- Good ol imported beer from mexico
        label = 'Martini',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_tequila', 
            pos = vec3(0.16, -0.12, -0.06), 
            rot = vec3(280.00, 90.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['tg_sunrise'] = { -- Good ol imported beer from mexico
        label = 'Tequilya Sunrise',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_tequsunrise', 
            pos = vec3(0.16, -0.1, -0.05), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['tg_tequilya'] = { -- Good ol imported beer from mexico
        label = 'Glass of Tequilya',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 70000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['ts_tequilya'] = { -- Good ol imported beer from mexico
        label = 'Shot of Tequilya',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['vg_nogo'] = { -- Good ol imported beer from mexico
        label = 'Glass of Nogo Vodka',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 70000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['vs_nogo'] = { -- Good ol imported beer from mexico
        label = 'Shot of Nogo Vodka',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['wg_mount'] = { -- Good ol imported beer from mexico
        label = 'Glass of Mount Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 70000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['wg_richards'] = { -- Good ol imported beer from mexico
        label = 'Glass of Richard\'s Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 70000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = 'prop_drink_whisky', 
            pos = vec3(0.16, -0.02, -0.06), 
            rot = vec3(270.00, 0.00, 0.00),
            bone = 57005},
            usetime = 12000,
        },
    },

    ['ws_mount'] = { -- Good ol imported beer from mexico
        label = 'Shot of Mount Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },

    ['ws_richards'] = { -- Good ol imported beer from mexico
        label = 'Shot of Richard\'s Whiskey',
        weight = 290,
        stack = true,
        close = true,
        description = "Like whiskey, but more ouch",
        client = {
            status = { drunk = 120000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'p_cs_shot_glass_2_s', 
            pos = vec3(0.02, -0.01, 0.08), 
            rot = vec3(1.0, 5.0, -182.5) },
            usetime = 2000,
        },
    },
    







    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- USABLES: Beer crates
    ['box_rancho_beer'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Rancho Beer',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love beer",
    },

    ['box_dusche_beer'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Dusche Beer',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love beer",
    },

    ['box_blarny_beer'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Blarny\'s Stout',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love beer",
    },

    ['box_patriot_beer'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Patriot Beer',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love beer",
    },

    ['box_bourgeoix_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Bourgeoix Cognac',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['box_cariaque_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Cariaque Bourbon',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['box_bleuterd_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Bleuter\'d Champagne',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['box_ragga_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Ragga Rum',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['box_tequilya_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Tequilya Tequila',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['box_nogo_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Nogo Vodka',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['box_mount_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Mount Whiskey',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },

    ['box_richards_liquor'] = { -- idea: Player uses item to show badge prop
        label = 'Case of Richard\'s Whiskey',
        weight = 8500,
        --consume = 0,
        description = "Oh boy I love liquor",
    },









    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- USABLES: Pizza boxes
    ['box_pizza_chs'] = { -- idea: Player uses item to show badge prop
        label = 'Box of Cheese Pizza',
        weight = 3500,
        --consume = 0,
        description = "A box of cheesy goodness, my guy",
        client = {
            anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
            prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
            pos = vec3(0.010, -0.100, -0.159), 
            rot = vec3(20.000, 0.000, 0.000), 
            bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['box_pizza_pep'] = { -- idea: Player uses item to show badge prop
        label = 'Box of Pepperoni Pizza',
        weight = 3500,
        --consume = 0,
        description = "A box of cheesy goodness, my guy",
        client = {
            anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
            prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
            pos = vec3(0.010, -0.100, -0.159), 
            rot = vec3(20.000, 0.000, 0.000), 
            bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['box_pizza_msh'] = { -- idea: Player uses item to show badge prop
        label = 'Box of Mushroom Pizza',
        weight = 3500,
        --consume = 0,
        description = "A box of cheesy goodness, my guy",
        client = {
            anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
            prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
            pos = vec3(0.010, -0.100, -0.159), 
            rot = vec3(20.000, 0.000, 0.000), 
            bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['box_pizza_mgt'] = { -- idea: Player uses item to show badge prop
        label = 'Box of Margherita Pizza',
        weight = 3500,
        --consume = 0,
        description = "A box of cheesy goodness, my guy",
        client = {
            anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
            prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
            pos = vec3(0.010, -0.100, -0.159), 
            rot = vec3(20.000, 0.000, 0.000), 
            bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['box_pizza_dmt'] = { -- idea: Player uses item to show badge prop
        label = 'Box of Double Meat Pizza',
        weight = 3500,
        --consume = 0,
        description = "A box of cheesy goodness, my guy",
        client = {
            anim = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
            prop = { model = 'bzzz_pizzahut_box_a', -- need badge props repo
            pos = vec3(0.010, -0.100, -0.159), 
            rot = vec3(20.000, 0.000, 0.000), 
            bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },










    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- USABLES: Ammo cases
    ['box_ammo_22'] = {
        label = 'Ammo Case: 5.56x45 (x30)',
        weight = 5000,
        consume = 0,
        description = "A case of stuff to make problems go away",
    },

    ['box_ammo_38'] = {
        label = 'Ammo Case: 7.62x39 (x30)',
        weight = 5000,
        consume = 0,
        description = "A case of stuff to make problems go away",
    },

    ['box_ammo_44'] = {
        label = 'Ammo Case: 12 Gauge (x30)',
        weight = 5000,
        consume = 0,
        description = "A case of stuff to make problems go away",
    },

    ['box_ammo_45'] = {
        label = 'Ammo Case: 7.62x51 (x30)',
        weight = 5000,
        consume = 0,
        description = "A case of stuff to make problems go away",
    },

    ['box_ammo_50'] = {
        label = 'Ammo Case: 5.56x45 (x30)',
        weight = 5000,
        consume = 0,
        description = "A case of stuff to make problems go away",
    },

    ['box_ammo_9'] = {
        label = 'Ammo Case: 7.62x39 (x30)',
        weight = 5000,
        consume = 0,
        description = "A case of stuff to make problems go away",
    },
	
    ['box_ammo_556m'] = {
        label = 'Ammo Case: 5.56x45 (x60)',
        weight = 5000,
        consume = 0,
        description = "A case of stuff to make problems go away",
    },

    ['box_ammo_762m'] = {
        label = 'Ammo Case: 7.62x39 (x60)',
        weight = 5000,
        consume = 0,
        description = "A case of stuff to make problems go away",
    },

    ['box_ammo_12g'] = {
        label = 'Ammo Case: 12 Gauge (x30)',
        weight = 5000,
        consume = 0,
        description = "A case of stuff to make problems go away",
    },

    ['box_ammo_76251m'] = {
        label = 'Ammo Case: 7.62x51 (x20)',
        weight = 5000,
        consume = 0,
        description = "A case of stuff to make problems go away",
    },










    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- USABLE: Items
    ['dingus'] = { 
        label = 'Dingus',
        weight = 6969,
        consume = 0,
        description = "Oh man, what a dingus, just Look at em",
    },

    ['phone'] = { 
        label = 'Phone',
        weight = 190,
        stack = false,
        consume = 0,
        client = {
            add = function(total)
                if total > 0 then
                    pcall(function() return exports.npwd:setPhoneDisabled(false) end)
                end
            end,

            remove = function(total)
                if total < 1 then
                    pcall(function() return exports.npwd:setPhoneDisabled(true) end)
                end
            end
        }
    },

    ['clothing_bag'] = { 
        label = 'Clothing Bag',
        weight = 3250,
        description = "For changing your outfit on the fly",
        stack = false,
        consume = 1,
    },

    ['wallet'] = { 
        label = 'Wallet',
        weight = 115,
        description = "If you lose this, you're gonna be sorry",
    },

    ['bandage'] = {
        label = 'Bandage',
        weight = 115,
        consume = 1,
        description = "Yes, this definetly will heal that gunshot wound",
    },

    ['medkit'] = { 
        label = 'Medical Kit',
        weight = 1500,
        consume = 1,
        description = "For them big ouchies and shit",
    },

    ['cig_69brand'] = { 
        label = 'Pack of 69Brand Smokes',
        weight = 250,
        stack = false,
        consume = 0.08,
        description = "Good for your lungs",
    },

    ['cig_redwood'] = { 
        label = 'Pack of Redwood Smokes',
        weight = 250,
        stack = false,
        consume = 0.08,
        description = "Good for your lungs",
    },

    ['cig_debonaire'] = { 
        label = 'Pack of Debonaire Smokes',
        weight = 250,
        stack = false,
        consume = 0.08,
        description = "Good for your lungs",
    },

    ['cigar'] = { 
        label = 'Cigar',
        weight = 115,
        description = "These REALLY aren't good for you, but fuck it",
    },

    -- If you are below the mpchristmas3 update, change the prop to 'ba_prop_battle_vape_01'
    ['vape'] = {
        label = 'Vape',
        weight = 115,
        description = "Vape-nash bruh, tastes like dissapointment",
        consume = 0,
        degrade = 60,
    },

    ['armor_l1'] = { 
        label = 'Light Ballistic Vest',
        weight = 3000,
        stack = false,
        description = "Bullts hurt a bit less with this",
    },

    ['armor_l2'] = { 
        label = 'Medium Ballistic Vest',
        weight = 4000,
        stack = false,
        description = "Bullets hurt a lot less with this",
    },

    ['armor_l3'] = { 
        label = 'Heavy Ballistic Vest',
        weight = 4500,
        stack = false,
        description = "Keep the extra bullets for personal vest flair",
    },

    ['parachute'] = { 
        label = 'Parachute',
        weight = 3000,
        stack = false,
        description = "For your sake, I hope it opens at the last second",
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 1500
        }
    },

    ['lockpick'] = { 
        label = 'Lockpicks',
        weight = 115,
        description = "Modern problems require sneaky solutions",
    },

    ['money'] = { 
        label = 'Money',
        weight = 0.05,
        description = "The root of all evil and payer of rent",
    },

    ['black_money'] = { 
        label = 'Marked Bills',
        weight = 0.05,
        description = "If you don't wash this, you can't use them. And you're stinky",
    },











    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- LEO: Tools
    ['armor_leo'] = { 
        label = 'LEO Ballistic Vest',
        weight = 4500,
        stack = false,
        description = "It ain't blue or fancy, but it's better than standard issue",
    },

    ['handcuffs'] = { 
        label = 'Steel Handcuffs',
        weight = 2000,
        stack = true,
        description = "Not even a magician can beat steel",
    },

    ['riotshield'] = { 
        label = 'LEO Riot Shield',
        weight = 4500,
        stack = false,
        description = "I think it stops bullets, but I know it looks cool",
    },









    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- USABLE: Tools
    ['bomb_exps'] = {
        label = 'I.E.D.',
        weight = 8500,
        description = "An improvised explosive device. In a bag",
        consume = 1,
        stack = false,
        close = true,
    },

    ['bomb_gas'] = {
        label = 'I.G.D.',
        weight = 8500,
        description = "An improvised explosive gas device. In a bag",
        consume = 1,
        stack = false,
        close = true,
    },

    ['vehkit_repair'] = { 
        label = 'Car Repair Kit',
        weight = 2500,
        consume = 1,
        description = "A trusty kit to fix even the dankest of dents",
    },

    ['vehkit_clean'] = { 
        label = 'Car Cleaning Kit',
        weight = 2500,
        consume = 1,
        description = "A trusty kit to fix even the dankest of dents",
    },

    ['divegear'] = { 
        label = 'Diving Gear',
        weight = 1500,
        consume = 0,
        description = "I can hold my breath longer than you can",
    },








    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- DRUGS: drugs
    ['weed_sativa'] = {
        label = '3oz Amnesia Haze',
        consume = 0.267,
        weight = 85,
        description = "I'm looking for a pick me up",
    },

    ['weed_indica'] = {
        label = '3oz Afghan Kush',
        consume = 0.267,
        weight = 85,
        description = "Wake me up in a hundred years",
    },

    ['weed_hybrid'] = {
        label = '3oz White Widow',
        consume = 0.267,
        weight = 85,
        description = "I don't even know, but this shit fucks",
    },

    ['crack_cocaine'] = {
        label = 'Cocaine',
        consume = 0.267,
        weight = 85,
        description = "Did you know cocaine could be a pill too? I bet you didn't",
    },

    ['crack_rocks'] = {
        label = 'Crack',
        consume = 0.267,
        weight = 85,
        description = "It ain't as blue as we like, but it works",
    },

    ['pill_ecstasy'] = {
        label = 'Ecstacy',
        consume = 0.267,
        weight = 85,
        description = "Am I the only one who see the hat man?",
    },

    ['pill_molly'] = {
        label = 'Molly',
        consume = 0.267,
        weight = 85,
        description = "If I ever did drugs, molly wouldn't be on the list",
    },









    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- BADGES: Police
    ['badge_fib'] = { -- idea: Player uses item to show badge prop
        label = 'FIB Badge',
        weight = 444,
        consume = 0,
        description = "For official use by FIB Agents only",
        client = {
            anim = { dict = 'paper_1_rcm_alt1-8', clip = 'player_one_dual-8', flag = 49 },
            prop = { model = 'prop_fibb_badge', -- need badge props repo
            pos = vec3(0.13, 0.023, -0.04), rot = vec3(-90.0, -180.0, 300.0), bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['badge_bcso'] = { -- idea: Player uses item to show badge prop
        label = 'BCSO Badge',
        weight = 444,
        consume = 0,
        description = "For official use by FIB Agents only",
        client = {
            anim = { dict = 'paper_1_rcm_alt1-8', clip = 'player_one_dual-8', flag = 49 },
            prop = { model = 'prop_bcso_badge', -- need badge props repo
            pos = vec3(0.13, 0.023, -0.04), rot = vec3(-90.0, -180.0, 300.0), bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['badge_lssd'] = { -- idea: Player uses item to show badge prop
        label = 'LSSD Badge',
        weight = 444,
        consume = 0,
        description = "For official use by FIB Agents only",
        client = {
            anim = { dict = 'paper_1_rcm_alt1-8', clip = 'player_one_dual-8', flag = 49 },
            prop = { model = 'prop_lssd_badge', -- need badge props repo
            pos = vec3(0.13, 0.023, -0.04), rot = vec3(-90.0, -180.0, 300.0), bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },

    ['badge_lspd'] = { -- idea: Player uses item to show badge prop
        label = 'LSPD Badge',
        weight = 444,
        consume = 0,
        description = "For official use by FIB Agents only",
        client = {
            anim = { dict = 'paper_1_rcm_alt1-8', clip = 'player_one_dual-8', flag = 49 },
            prop = { model = 'prop_lspd_badge', -- need badge props repo
            pos = vec3(0.13, 0.023, -0.04), rot = vec3(-90.0, -180.0, 300.0), bone = 28422 },
            disable = { move = false, car = false, combat = false },
            usetime = 5000,
        }
    },









    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- MRE: Meal Ready to Eat
    ['mre_1'] = { 
        label = 'MRE-001',
        weight = 3500,
        stack = false,
        close = false,
        description = "Contains: Meal, Side, Bread, Dessert",
    },

    -- Main meals
    ['mre_chilimac'] = { 
        label = 'MRE - Chili Mac',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_beefstew'] = { 
        label = 'MRE - Beef Stew',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_chkenchilada'] = { 
        label = 'MRE - Chkn Enchiladas',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_veggieomelet'] = { 
        label = 'MRE - Veggie Omelet',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_chknking'] = { 
        label = 'MRE - Chicken-a-la-king',
        weight = 1250,
        stack = true,
        close = true,
        description = "Meal-ready-to-eat",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    -- Supp. food
    ['mre_tmsoup'] = { 
        label = 'MRE Tom. soup',
        weight = 1250,
        stack = true,
        close = true,
        description = "Standard military side soup",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tintomsoup', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_corn'] = { 
        label = 'MRE Canned Corn',
        weight = 1250,
        stack = true,
        close = true,
        description = "Standard military side dish",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = 'v_res_fa_tincorn', 
            pos = vec3(-0.01, -0.01, 0.01), rot = vec3(1.0, 5.0, -182.5) },
            usetime = 7500,
        },
    },

    ['mre_bread'] = { 
        label = 'MRE Bread',
        weight = 1250,
        stack = true,
        close = true,
        description = "Standard military bread",
        client = {
            status = { hunger = 250000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = 'v_res_fa_bread03', 
            bone = 18905,
            pos = vec3(0.14, 0.03, 0.01), 
            rot = vec3(85.0, 70.0, -203.0) },
            usetime = 7500,
        },
    },









    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- TICKETS: mba events
    ['mbaticket_lux'] = { 
        label = 'MBA Ticket: Luxury',
        weight = 500,
        stack = false,
        degrade = 2,
        consume = 1,
        description = "VIP lounge with a kitchen and bar",
    },

    ['mbaticket_dlx'] = { 
        label = 'MBA Ticket: Delux',
        weight = 500,
        stack = false,
        degrade = 2,
        consume = 1,
        description = "Sit in the upper area for a better view",
    },

    ['mbaticket_std'] = { 
        label = 'MBA Ticket: Standard',
        weight = 500,
        stack = false,
        degrade = 2,
        consume = 1,
        description = "Standard seating close to the arena",
        
    },









    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- TOOLS: fleeca heist update
    ['bag_blackmoney'] = { 
        label = 'Marked bills',
        weight = 5000,
        stack = false,
        description = "They could probably use a wash or two",
    },

    ['drill_thermal'] = { 
        label = 'Thermal Drill',
        weight = 20000,
        stack = false,
        description = "That there is a big boi",
    },

    ['hack_tablet'] = { 
        label = 'Hacking Tablet',
        weight = 1200,
        stack = false,
        description = "The power of the web in the palm of my hands", 
    },

    ['scard_fleeca'] = { 
        label = 'Fleeca Security Card',
        weight = 350,
        stack = false,
        description = "Held by Fleeca Bank Managers",
    },









    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- Trading Cards
    ['lstradingcard'] = {
    label = 'L.S. Lore Card',
    weight = 10,
    consume = 0,
    server = {
        export = 'mi_utils.lstradingcard',
        }
    },

    ['lscardbook_black'] = {
        label = 'Black Card Binder',
        weight = 500,
        consume = 0,
    },
    
    ['lscardbook_blue'] = {
        label = 'Blue Card Binder',
        weight = 500,
        consume = 0,
    },

    ['lscardbook_green'] = {
        label = 'Green Card Binder',
        weight = 500,
        consume = 0,
    },

    ['lscardbook_yellow'] = {
        label = 'Yellow Card Binder',
        weight = 500,
        consume = 0,
    },









    ----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------- 
    -- Work Items
    ['phone_work'] = {
        label = 'Work Phone',
        weight = 25,
        consume = 0,
	},

	["alive_chicken"] = {
		label = "Living chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["blowpipe"] = {
		label = "Blowtorch",
		weight = 2,
		stack = true,
		close = true,
	},

	["bread"] = {
		label = "Bread",
		weight = 1,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
	},

	["carokit"] = {
		label = "Body Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["carotool"] = {
		label = "Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["clothe"] = {
		label = "Cloth",
		weight = 1,
		stack = true,
		close = true,
	},

	["copper"] = {
		label = "Copper",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Cut wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1,
		stack = true,
		close = true,
	},

	["essence"] = {
		label = "Gas",
		weight = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Fabric",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish"] = {
		label = "Fish",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixkit"] = {
		label = "Repair Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["fixtool"] = {
		label = "Repair Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Gas Bottle",
		weight = 2,
		stack = true,
		close = true,
	},

	["gold"] = {
		label = "Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["iron"] = {
		label = "Iron",
		weight = 1,
		stack = true,
		close = true,
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 2,
		stack = true,
		close = true,
	},

	["medikit"] = {
		label = "Medikit",
		weight = 2,
		stack = true,
		close = true,
	},

	["packaged_chicken"] = {
		label = "Chicken fillet",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_plank"] = {
		label = "Packaged wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol"] = {
		label = "Oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol_raffin"] = {
		label = "Processed oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["radio"] = {
		label = "Radio",
		weight = 1,
		stack = true,
		close = true,
	},

	["slaughtered_chicken"] = {
		label = "Slaughtered chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["stone"] = {
		label = "Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["washed_stone"] = {
		label = "Washed stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["wood"] = {
		label = "Wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["wool"] = {
		label = "Wool",
		weight = 1,
		stack = true,
		close = true,
	},

    ['advanced_pickaxe'] = {
        label = 'Advanced Pickaxe',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Advanced Pickaxe',
        image = 'advanced_pickaxe.png',
        unique = false
    },

    ['blackpowder'] = {
        label = 'Black Powder',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Black Powder',
        image = 'blackpowder.png',
        unique = false
    },

    ['coal'] = {
        label = 'Coal',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Coal',
        image = 'coal.png',
        unique = false
    },

    ['concrete'] = {
        label = 'Concrete',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Concrete',
        image = 'concrete.png',
        unique = false
    },

    ['copper_ingot'] = {
        label = 'Copper Ingot',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Copper Ingot',
        image = 'copper_ingot.png',
        unique = false
    },

    ['copper_ore'] = {
        label = 'Copper Ore',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Copper Ore',
        image = 'copper_ore.png',
        unique = false
    },

    ['diamond_ingot'] = {
        label = 'Diamond Ingot',
        weight = 100,
        stack = 10,
        usable = false,
        close = true,
        description = 'Diamond Ingot',
        image = 'diamond_ingot.png',
        unique = false
    },

    ['diamond_ore'] = {
        label = 'Diamond Ore',
        weight = 100,
        stack = 10,
        usable = false,
        close = true,
        description = 'Diamond Ore',
        image = 'diamond_ore.png',
        unique = false
    },

    ['glass'] = {
        label = 'Glass',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Glass',
        image = 'glass.png',
        unique = false
    },

    ['glass_mold'] = {
        label = 'Glass Mold',
        weight = 100,
        stack = 5,
        usable = false,
        close = true,
        description = 'Glass Mold',
        image = 'glass_mold.png',
        unique = false
    },

    ['goldingot'] = {
        label = 'Gold Ingot',
        weight = 100,
        stack = 10,
        usable = false,
        close = true,
        description = 'Gold Ingot',
        image = 'goldingot.png',
        unique = false
    },

    ['gold_ore'] = {
        label = 'Gold Ore',
        weight = 100,
        stack = 10,
        usable = false,
        close = true,
        description = 'Gold Ore',
        image = 'gold_ore.png',
        unique = false
    },

    ['ingot_mold'] = {
        label = 'Ingot Mold',
        weight = 100,
        stack = 5,
        usable = false,
        close = true,
        description = 'Ingot Mold',
        image = 'ingot_mold.png',
        unique = false
    },

    ['iron_ingot'] = {
        label = 'Iron Ingot',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Iron Ingot',
        image = 'iron_ingot.png',
        unique = false
    },

    ['iron_ore'] = {
        label = 'Iron Ore',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Iron Ore',
        image = 'iron_ore.png',
        unique = false
    },

    ['limestone'] = {
        label = 'Limestone',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Limestone',
        image = 'limestone.png',
        unique = false
    },

    ['normal_pickaxe'] = {
        label = 'Normal Pickaxe',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Normal Pickaxe',
        image = 'normal_pickaxe.png',
        unique = false
    },

    ['professional_pickaxe'] = {
        label = 'Professional Pickaxe',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Professional Pickaxe',
        image = 'professional_pickaxe.png',
        unique = false
    },

    ['rock'] = {
        label = 'Rock',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Rock',
        image = 'rock.png',
        unique = false
    },

    ['sandstone'] = {
        label = 'Sandstone',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Sandstone',
        image = 'sandstone.png',
        unique = false
    },

    ['special_water'] = {
        label = 'Special Water',
        weight = 100,
        stack = 10,
        usable = false,
        close = true,
        description = 'Special Water',
        image = 'special_water.png',
        unique = false
    },

    ['sticky_gel'] = {
        label = 'Sticky Gel',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Sticky Gel',
        image = 'sticky_gel.png',
        unique = false
    },

    ['sulfur'] = {
        label = 'Sulfur',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Sulfur',
        image = 'sulfur.png',
        unique = false
    },

    ['acrylic'] = {
        label = 'Acrylic',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Acrylic',
        image = 'acrylic.png',
        unique = false
    },

    ['binco_basic_blazer'] = {
        label = 'Basic Blazer',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Basic Blazer',
        image = 'binco_basic_blazer.png',
        unique = false
    },

    ['binco_basic_blouse'] = {
        label = 'Basic Blouse',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Basic Blouse',
        image = 'binco_basic_blouse.png',
        unique = false
    },

    ['binco_basic_bralet'] = {
        label = 'Basic Bralet',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Basic Bralet',
        image = 'binco_basic_bralet.png',
        unique = false
    },

    ['binco_basic_jean'] = {
        label = 'Basic Jean',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Basic Jean',
        image = 'binco_basic_jean.png',
        unique = false
    },

    ['binco_basic_jumpsuit'] = {
        label = 'Basic Jumpsuit',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Basic Jumpsuit',
        image = 'binco_basic_jumpsuit.png',
        unique = false
    },

    ['binco_basic_shirt'] = {
        label = 'Basic Shirt',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Basic Shirt',
        image = 'binco_basic_shirt.png',
        unique = false
    },

    ['binco_basic_short'] = {
        label = 'Basic Short',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Basic Short',
        image = 'binco_basic_short.png',
        unique = false
    },

    ['binco_basic_singlet'] = {
        label = 'Basic Singlet',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Basic Singlet',
        image = 'binco_basic_singlet.png',
        unique = false
    },

    ['binco_basic_sweatshirt'] = {
        label = 'Basic Sweatshirt',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Basic Sweatshirt',
        image = 'binco_basic_sweatshirt.png',
        unique = false
    },

    ['binco_basic_tshirt'] = {
        label = 'Basic Tshirt',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Basic Tshirt',
        image = 'binco_basic_tshirt.png',
        unique = false
    },

    ['binco_basic_vest'] = {
        label = 'Basic Vest',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Basic Vest',
        image = 'binco_basic_vest.png',
        unique = false
    },

    ['cashmere'] = {
        label = 'Cashmere',
        weight = 100,
        stack = 10,
        usable = false,
        close = true,
        description = 'Cashmere',
        image = 'cashmere.png',
        unique = false
    },

    ['cotton'] = {
        label = 'Cotton',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Cotton',
        image = 'cotton.png',
        unique = false
    },

    ['cupro'] = {
        label = 'Cupro',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Cupro',
        image = 'cupro.png',
        unique = false
    },

    ['fiber'] = {
        label = 'Fiber',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Fiber',
        image = 'fiber.png',
        unique = false
    },

    ['hemp'] = {
        label = 'Hemp',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Hemp',
        image = 'hemp.png',
        unique = false
    },

    ['iron'] = {
        label = 'Iron',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Iron',
        image = 'iron.png',
        unique = false
    },

    ['jute'] = {
        label = 'Jute',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Jute',
        image = 'jute.png',
        unique = false
    },

    ['knitting_wheel'] = {
        label = 'Knitting Wheel',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Knitting Wheel',
        image = 'knitting_wheel.png',
        unique = false
    },

    ['linen'] = {
        label = 'Linen',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Linen',
        image = 'linen.png',
        unique = false
    },

    ['lyocell'] = {
        label = 'Lyocell',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Lyocell',
        image = 'lyocell.png',
        unique = false
    },

    ['metal'] = {
        label = 'Metal',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Metal',
        image = 'metal.png',
        unique = false
    },

    ['metal_bobbin'] = {
        label = 'Metal Bobbin',
        weight = 100,
        stack = 5,
        usable = false,
        close = true,
        description = 'Metal Bobbin',
        image = 'metal_bobbin.png',
        unique = false
    },

    ['nubuck'] = {
        label = 'Nubuck',
        weight = 100,
        stack = 10,
        usable = false,
        close = true,
        description = 'Nubuck',
        image = 'nubuck.png',
        unique = false
    },

    ['paint'] = {
        label = 'Paint',
        weight = 100,
        stack = 20,
        usable = false,
        close = true,
        description = 'Paint',
        image = 'paint.png',
        unique = false
    },

    ['polyester'] = {
        label = 'Polyester',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Polyester',
        image = 'polyester.png',
        unique = false
    },

    ['ponsonbys_belt'] = {
        label = 'Classy Belt',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Classy Belt',
        image = 'ponsonbys_belt.png',
        unique = false
    },

    ['ponsonbys_chino'] = {
        label = 'Chino',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Chino',
        image = 'ponsonbys_chino.png',
        unique = false
    },

    ['ponsonbys_jacket'] = {
        label = 'Suit Jacket',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Suit Jacket',
        image = 'ponsonbys_jacket.png',
        unique = false
    },

    ['ponsonbys_shirt'] = {
        label = 'Grey Shirt',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Grey Shirt',
        image = 'ponsonbys_shirt.png',
        unique = false
    },

    ['ponsonbys_suit'] = {
        label = 'Full Suit',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Full Suit',
        image = 'ponsonbys_suit.png',
        unique = false
    },

    ['ponsonbys_tie'] = {
        label = 'Tie',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Tie',
        image = 'ponsonbys_tie.png',
        unique = false
    },

    ['ponsonbys_waistcoats'] = {
        label = 'Waistcoats',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Waistcoats',
        image = 'ponsonbys_waistcoats.png',
        unique = false
    },

    ['quality_silk'] = {
        label = 'Quality Silk',
        weight = 100,
        stack = 10,
        usable = false,
        close = true,
        description = 'Quality Silk',
        image = 'quality_silk.png',
        unique = false
    },

    ['rope_reel'] = {
        label = 'Rope Reel',
        weight = 100,
        stack = 10,
        usable = false,
        close = true,
        description = 'Rope Reel',
        image = 'rope_reel.png',
        unique = false
    },

    ['silver'] = {
        label = 'Silver',
        weight = 100,
        stack = 10,
        usable = false,
        close = true,
        description = 'Silver',
        image = 'silver.png',
        unique = false
    },

    ['spandex'] = {
        label = 'Spandex',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Spandex',
        image = 'spandex.png',
        unique = false
    },

    ['steel_bobbin'] = {
        label = 'Steel Bobbin',
        weight = 100,
        stack = 5,
        usable = false,
        close = true,
        description = 'Steel Bobbin',
        image = 'steel_bobbin.png',
        unique = false
    },

    ['suburban_bralet'] = {
        label = 'Suburban Bralet',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Suburban Bralet',
        image = 'suburban_bralet.png',
        unique = false
    },

    ['suburban_chain'] = {
        label = 'Chain',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Chain',
        image = 'suburban_chain.png',
        unique = false
    },

    ['suburban_dress'] = {
        label = 'Suburban Dress',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Suburban Dress',
        image = 'suburban_dress.png',
        unique = false
    },

    ['suburban_jogger'] = {
        label = 'Suburban Jogger',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Suburban Jogger',
        image = 'suburban_jogger.png',
        unique = false
    },

    ['suburban_shirt'] = {
        label = 'Suburban Shirt',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Suburban Shirt',
        image = 'suburban_shirt.png',
        unique = false
    },

    ['suburban_short'] = {
        label = 'Suburban Short',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Suburban Short',
        image = 'suburban_short.png',
        unique = false
    },

    ['suburban_skirt'] = {
        label = 'Skirt',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Skirt',
        image = 'suburban_skirt.png',
        unique = false
    },

    ['suburban_tshirt'] = {
        label = 'Suburban Tshirt',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Suburban Tshirt',
        image = 'suburban_tshirt.png',
        unique = false
    },

    ['suburban_sweatshirt'] = {
        label = 'Suburban Sweatshirt',
        weight = 100,
        stack = 1,
        usable = false,
        close = true,
        description = 'Suburban Sweatshirt',
        image = 'suburban_sweatshirt.png',
        unique = false
    },

    ['thin_needle'] = {
        label = 'Thin Needle',
        weight = 100,
        stack = 10,
        usable = false,
        close = true,
        description = 'Thin Needle',
        image = 'thin_needle.png',
        unique = false
    },

    ['wool'] = {
        label = 'Wool Yarn',
        weight = 100,
        stack = 50,
        usable = false,
        close = true,
        description = 'Wool Yarn',
        image = 'wool.png',
        unique = false
    },

    ["pigeonmeat"] = {
        label = "Pigeon Meat",
        weight = 1000,
        stack = true,
        close = true,
        description = "Delicious pigeon meat for your culinary adventures.",
    },
    ["pigeonfeather"] = {
        label = "Pigeon Feather",
        weight = 1000,
        stack = true,
        close = true,
        description = "A soft and lightweight feather from a pigeon.",
    },
    ["crowmeat"] = {
        label = "Crow Meat",
        weight = 1000,
        stack = true,
        close = true,
        description = "Tasty crow meat, perfect for daring gourmets.",
    },
    ["crowfeather"] = {
        label = "Crow Feather",
        weight = 1000,
        stack = true,
        close = true,
        description = "A sleek and dark feather from a crow.",
    },
    ["seagullmeat"] = {
        label = "Seagull Meat",
        weight = 1000,
        stack = true,
        close = true,
        description = "Savory seagull meat, a delicacy among fishermen.",
    },
    ["seagullfeather"] = {
        label = "Seagull Feather",
        weight = 1000,
        stack = true,
        close = true,
        description = "A graceful and light feather from a seagull.",
    },
    ["cormorantmeat"] = {
        label = "Cormorant Meat",
        weight = 1000,
        stack = true,
        close = true,
        description = "Meaty cormorant meat, a rare find for adventurous eaters.",
    },
    ["cormorantbeak"] = {
        label = "Cormorant Beak",
        weight = 1000,
        stack = true,
        close = true,
        description = "A sturdy and pointed beak from a cormorant.",
    },
    ["deermeat"] = {
        label = "Deer Meat",
        weight = 1000,
        stack = true,
        close = true,
        description = "Succulent deer meat, a favorite among hunters.",
    },
    ["deerhorn"] = {
        label = "Deer Horn",
        weight = 1000,
        stack = true,
        close = true,
        description = "A majestic horn from a deer, prized for its beauty.",
    },
    ["rabbitmeat"] = {
        label = "Rabbit Meat",
        weight = 1000,
        stack = true,
        close = true,
        description = "Tender rabbit meat, perfect for stews and roasts.",
    },
    ["rabbitskin"] = {
        label = "Rabbit Skin",
        weight = 1000,
        stack = true,
        close = true,
        description = "A soft and supple skin from a rabbit, ideal for crafting.",
    },
    ["ratmeat"] = {
        label = "Rat Meat",
        weight = 1000,
        stack = true,
        close = true,
        description = "Edible rat meat, a survivalist's choice in desperate times.",
    },
    ["pigmeat"] = {
        label = "Pig Meat",
        weight = 1000,
        stack = true,
        close = true,
        description = "Juicy pig meat, a staple in many hearty meals.",
    },
    ["pigskin"] = {
        label = "Pig Skin",
        weight = 1000,
        stack = true,
        close = true,
        description = "Thick and durable pig skin, useful for crafting leather goods.",
    },
    ["coyotemeat"] = {
        label = "Coyote Meat",
        weight = 1000,
        stack = true,
        close = true,
        description = "Lean and gamey coyote meat, favored by wilderness enthusiasts.",
    },
    ["coyoteskin"] = {
        label = "Coyote Skin",
        weight = 1000,
        stack = true,
        close = true,
        description = "Tough and weather-resistant coyote skin, perfect for outdoor gear.",
    },
    ["coguarmeat"] = {
        label = "Cougarmeat",
        weight = 1000,
        stack = true,
        close = true,
        description = "Exotic cougarmeat, a delicacy for adventurous palates.",
    },
    ["coguarskin"] = {
        label = "Cougar Skin",
        weight = 1000,
        stack = true,
        close = true,
        description = "Supple cougar skin, highly valued in the fashion industry.",
    },
    ["boarmeat"] = {
        label = "Boar Meat",
        weight = 1000,
        stack = true,
        close = true,
        description = "Hearty boar meat, a popular choice among hunters and chefs.",
    },
    ["boarskin"] = {
        label = "Boar Skin",
        weight = 1000,
        stack = true,
        close = true,
        description = "Tough boar skin, excellent for crafting rugged goods.",
    },
    ["snakemeat"] = {
        label = "Snake Meat",
        weight = 1000,
        stack = true,
        close = true,
        description = "Savory snake meat, a delicacy in some cultures.",
    },
    ["boarhorn"] = {
        label = "Boar Horn",
        weight = 1000,
        stack = true,
        close = true,
        description = "A large and impressive horn from a boar.",
    },
    ["snakeskin"] = {
        label = "Snake Skin",
        weight = 1000,
        stack = true,
        close = true,
        description = "Smooth and patterned snake skin, used for various crafts.",
    },
    ["hawkmeat"] = {
        label = "Hawk Meat",
        weight = 1000,
        stack = true,
        close = true,
        description = "Lean and gamey hawk meat, a rare delicacy among hunters.",
    },
    ["hawkskin"] = {
        label = "Hawk Skin",
        weight = 1000,
        stack = true,
        close = true,
        description = "Beautiful hawk skin, prized for its unique markings.",
    },
    ["hawkpeak"] = {
        label = "Hawk Peak",
        weight = 1000,
        stack = true,
        close = true,
        description = "A majestic feather from a hawk's peak, a symbol of freedom.",
    },

    ['indica_seed'] = {
        label = 'Indica Seed',
        weight = 100,
        stack = 50,
        usable = false,
        close = false,
        description = 'Indica Seed',
        image = 'indica_seed.png',
        unique = false
    },

    ['sativa_seed'] = {
        label = 'Sativa Seed',
        weight = 100,
        stack = 50,
        usable = false,
        close = false,
        description = 'Sativa Seed',
        image = 'sativa_seed.png',
        unique = false
    },

    ['indica_weed'] = {
        label = 'Indica Weed',
        weight = 0,
        stack = 20,
        usable = false,
        close = false,
        description = 'Indica Weed',
        image = 'indica_weed.png',
        unique = false
    },

    ['sativa_weed'] = {
        label = 'Sativa Weed',
        weight = 0,
        stack = 20,
        usable = false,
        close = false,
        description = 'Sativa Weed',
        image = 'sativa_weed.png',
        unique = false
    },

    ['fertilizer'] = {
        label = 'Fertilizer',
        weight = 0,
        stack = 20,
        usable = false,
        close = false,
        description = 'Fertilizer',
        image = 'fertilizer.png',
        unique = false
    },

    ['quality_fertilizer'] = {
        label = 'Quality Fertilizer',
        weight = 0,
        stack = 10,
        usable = false,
        close = false,
        description = 'Quality Fertilizer',
        image = 'quality_fertilizer.png',
        unique = false
    },

    ['spray'] = {
        label = 'Spray',
        weight = 0,
        stack = 5,
        usable = false,
        close = false,
        description = 'Spray',
        image = 'spray.png',
        unique = false
    },

    ['grubber'] = {
        label = 'Grubber',
        weight = 0,
        stack = 5,
        usable = false,
        close = false,
        description = 'Grubber',
        image = 'grubber.png',
        unique = false
    },

    ['raw_paper'] = {
        label = 'Raw Paper',
        weight = 0,
        stack = 50,
        usable = false,
        close = false,
        description = 'Raw Paper',
        image = 'raw_paper.png',
        unique = false
    },

    ['grinder'] = {
        label = 'Grinder',
        weight = 0,
        stack = 1,
        usable = false,
        close = false,
        description = 'Grinder',
        image = 'grinder.png',
        unique = false
    },

    ['indica_joint'] = {
        label = 'Indica Joint',
        weight = 0,
        stack = 5,
        usable = true,
        close = false,
        description = 'Indica Joint',
        image = 'indica_joint.png',
        unique = false
    },

    ['sativa_joint'] = {
        label = 'Sativa Joint',
        weight = 0,
        stack = 5,
        usable = true,
        close = false,
        description = 'Sativa Joint',
        image = 'sativa_joint.png',
        unique = false
    },

    ['lemon_haze_joint'] = {
        label = 'Lemon Haze Joint',
        weight = 0,
        stack = 5,
        usable = true,
        close = false,
        description = 'Lemon Haze Joint',
        image = 'lemon_haze_joint.png',
        unique = false
    },

    ['purple_haze_joint'] = {
        label = 'Purple Haze Joint',
        weight = 0,
        stack = 5,
        usable = true,
        close = false,
        description = 'Purple Haze Joint',
        image = 'purple_haze_joint.png',
        unique = false
    },

    ['grinded_indica'] = {
        label = 'Grinded Indica',
        weight = 0,
        stack = 50,
        usable = false,
        close = false,
        description = 'Grinded Indica',
        image = 'grinded_indica.png',
        unique = false
    },

    ['grinded_sativa'] = {
        label = 'Grinded Sativa',
        weight = 0,
        stack = 50,
        usable = false,
        close = false,
        description = 'Grinded Sativa',
        image = 'grinded_sativa.png',
        unique = false
    },


	["suppressor2"] = {
		label = "Flat Muzzle Brake",
		weight = -1,
		stack = true,
		close = true,
	},

	["suppressor3"] = {
		label = "Tactical Muzzle Brake",
		weight = -1,
		stack = true,
		close = true,
	},

	["suppressor4"] = {
		label = "Fat-End Muzzle Brake",
		weight = -1,
		stack = true,
		close = true,
	},

	["suppressor5"] = {
		label = "Precision Muzzle Brake",
		weight = -1,
		stack = true,
		close = true,
	},

	["suppressor6"] = {
		label = "Heavy Duty Muzzle Brake",
		weight = -1,
		stack = true,
		close = true,
	},

	["barrel"] = {
		label = "Default Barrel",
		weight = -1,
		stack = true,
		close = true,
	},

	["barrel2"] = {
		label = "Heavy Barrel",
		weight = -1,
		stack = true,
		close = true,
	},

	["scope3"] = {
		label = "Zoom Scope",
		weight = -1,
		stack = true,
		close = true,
	},

	["grip"] = {
		label = "Grip",
		weight = -1,
		stack = true,
		close = true,
	},

	["defaultclip"] = {
		label = "Default Magazine",
		weight = -1,
		stack = true,
		close = true,
	},

	["drummag"] = {
		label = "Drum Maganize",
		weight = -1,
		stack = true,
		close = true,
	},

	["extendedclip"] = {
		label = "Extended Magazine",
		weight = -1,
		stack = true,
		close = true,
	},

	["suppressor8"] = {
		label = "Split-End Muzzle Brake",
		weight = -1,
		stack = true,
		close = true,
	},

	["suppressor7"] = {
		label = "Slanted Muzzle Brake",
		weight = -1,
		stack = true,
		close = true,
	},

	["scope"] = {
		label = "Scope",
		weight = -1,
		stack = true,
		close = true,
	},

	["scope2"] = {
		label = "Advanced Scope",
		weight = -1,
		stack = true,
		close = true,
	},

	["suppressor"] = {
		label = "Suppressor",
		weight = -1,
		stack = true,
		close = true,
	},

	["flashlight"] = {
		label = "Flashlight",
		weight = -1,
		stack = true,
		close = true,
	},

	["concrete_package"] = {
		label = "Concrete Package",
		weight = 1,
		stack = true,
		close = true,
	},
}