data.raw["beacon"]["beacon"].collision_mask =
	{layers={ ["item-layer"] = true, ["object-layer"] = true, ["floor-layer"] = true, ["water-tile"] = true}}

if mods["bobmodules"] then
	data.raw["beacon"]["beacon-2"].collision_mask =
		{layers={ ["item-layer"] = true, ["object-layer"] = true, ["floor-layer"] = true, ["water-tile"] = true }}
	data.raw["beacon"]["beacon-3"].collision_mask =
		{layers={ ["item-layer"] = true, ["object-layer"] = true, ["floor-layer"] = true, ["water-tile"] = true }}
end
