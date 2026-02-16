data:extend({
	{ -- Basic Warehouse
		type = "recipe",
		name = "warehouse-basic",
		enabled = "false",
		ingredients =
		{
		    { "storehouse-basic", 2 }, --added drd
			{ "steel-plate", 200 },
			{ "stone-brick", 40 },
			{ "iron-stick", 85 },
		},
		energy_required = 30, 
		results ={{type="item", name= "warehouse-basic", amount=1}},
	},
	{ -- Passive Provider Warehouse
		type = "recipe",
		name = "warehouse-passive-provider",
		enabled = "false",
		ingredients =
		{
			{ "warehouse-basic", 1 },
			{ "logistic-chest-passive-provider", 1 },
			{ "steel-plate", 10 },
			{ "iron-stick", 15 },
		},
		energy_required = 5,
		results ={{type="item", name= "warehouse-passive-provider", amount=1}},
	},
	{ -- Storage Warehouse
		type = "recipe",
		name = "warehouse-storage",
		enabled = "false",
		ingredients =
		{
			{ "warehouse-basic", 1 },
			{ "logistic-chest-storage", 1 },
			{ "steel-plate", 10 },
			{ "iron-stick", 15 },
		},
		energy_required = 5,
		results ={{type="item", name= "warehouse-storage", amount=1}},
	},
	{ -- Active Provider Warehouse
		type = "recipe",
		name = "warehouse-active-provider",
		enabled = "false",
		ingredients =
		{
			{ "warehouse-basic", 1 },
			{ "logistic-chest-active-provider", 1 },
			{ "steel-plate", 10 },
			{ "iron-stick", 15 },
		},
		energy_required = 5,
		results ={{type="item", name= "warehouse-active-provider", amount=1}},
	},
	{ -- Requester Warehouse
		type = "recipe",
		name = "warehouse-requester",
		enabled = "false",
		ingredients =
		{
			{ "warehouse-basic", 1 },
			{ "logistic-chest-requester", 1 },
			{ "steel-plate", 10 },
			{ "iron-stick", 15 },
		},
		energy_required = 5,
		results ={{type="item", name= "warehouse-requester", amount=1}},
	},
	{ -- Buffer Warehouse
		type = "recipe",
		name = "warehouse-buffer",
		enabled = "false",
		ingredients =
		{
			{ "warehouse-basic", 1 },
			{ "logistic-chest-buffer", 1 },
			{ "steel-plate", 10 },
			{ "iron-stick", 15 },
		},
		energy_required = 5,
		results ={{type="item", name= "warehouse-buffer", amount=1}},
	},
	{ -- Basic Storehouse
		type = "recipe",
		name = "storehouse-basic",
		enabled = "false",
		ingredients =
		{
			{ "steel-chest", 10 }, --drd
			{ "steel-plate", 50 },
			{ "stone-brick", 10 },
			{ "iron-stick", 16 },
		},
		energy_required = 30,
		results ={{type="item", name= "storehouse-basic", amount=1}},
	},
	{ -- Passive Provider Storehouse
		type = "recipe",
		name = "storehouse-passive-provider",
		enabled = "false",
		ingredients =
		{
			{ "storehouse-basic", 1 },
			{ "logistic-chest-passive-provider", 1 },
			{ "iron-stick", 16 }, --drd
		},
		energy_required = 5,
		results ={{type="item", name= "storehouse-passive-provider", amount=1}},
	},
	{ -- Storage Storehouse
		type = "recipe",
		name = "storehouse-storage",
		enabled = "false",
		ingredients =
		{
			{ "storehouse-basic", 1 },
			{ "logistic-chest-storage", 1 },
			{ "iron-stick", 16 }, --drd
		},
		energy_required = 5,
		results ={{type="item", name= "storehouse-storage", amount=1}},
	},
	{ -- Active Provider Storehouse
		type = "recipe",
		name = "storehouse-active-provider",
		enabled = "false",
		ingredients =
		{
			{ "storehouse-basic", 1 },
			{ "logistic-chest-active-provider", 1 },
			{ "iron-stick", 16 }, --drd
		},
		energy_required = 5,
		results ={{type="item", name= "storehouse-active-provider", amount=1}},
	},
	{ -- Requester Storehouse
		type = "recipe",
		name = "storehouse-requester",
		enabled = "false",
		ingredients =
		{
			{ "storehouse-basic", 1 },
			{ "logistic-chest-requester", 1 },
			{ "iron-stick", 16 }, --drd
		},
		energy_required = 5,
		results ={{type="item", name= "storehouse-requester", amount=1}},
	},
	{ -- Buffer Storehouse
		type = "recipe",
		name = "storehouse-buffer",
		enabled = "false",
		ingredients =
		{
			{ "storehouse-basic", 1 },
			{ "logistic-chest-buffer", 1 },
			{ "iron-stick", 16 }, --drd
		},
		energy_required = 5,
		results ={{type="item", name= "storehouse-buffer", amount=1}},
	},
})
