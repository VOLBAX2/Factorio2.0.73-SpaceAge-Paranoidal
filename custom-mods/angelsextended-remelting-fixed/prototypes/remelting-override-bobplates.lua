local OV = angelsmods.functions.OV

OV.add_unlock("angels-liquid-molten-bronze", "molten-bronze-alloy-mixing-1")
OV.add_unlock("angels-liquid-molten-bronze-2", "molten-bronze-alloy-mixing-2")
OV.add_unlock("angels-liquid-molten-bronze-3", "molten-bronze-alloy-mixing-3")

OV.add_unlock("angels-liquid-molten-brass", "molten-brass-alloy-mixing-1")
OV.add_unlock("angels-liquid-molten-brass-2", "molten-brass-alloy-mixing-2")
OV.add_unlock("angels-liquid-molten-brass-3", "molten-brass-alloy-mixing-3")

OV.add_unlock("angels-liquid-molten-gunmetal", "molten-gunmetal-alloy-mixing-1")

OV.add_unlock("angels-liquid-molten-invar", "molten-invar-alloy-mixing-1")

OV.add_unlock("angels-liquid-molten-cobalt-steel", "molten-cobalt-steel-alloy-mixing-1")

OV.add_unlock("angels-liquid-molten-nitinol", "molten-nitinol-alloy-mixing-1")

if settings.startup["remelting-smooth-integration"].value then
	--BRONZE
	OV.add_unlock("angels-liquid-molten-bronze-2", "molten-bronze-remelting")
	--BRASS
	OV.add_unlock("angels-liquid-molten-brass-2", "molten-brass-remelting")
	--GUNMETAL
	OV.add_unlock("angels-liquid-molten-gunmetal", "molten-gunmetal-remelting")
	--INVAR
	OV.add_unlock("angels-liquid-molten-invar", "molten-invar-remelting")
	--COBALT STEEL
	OV.add_unlock("angels-liquid-molten-cobalt-steel", "molten-cobalt-steel-remelting")
	--NITINOL
	OV.add_unlock("angels-liquid-molten-nitinol", "molten-nitinol-remelting")
else
	aragasmods.functions.OV.enable_technology("remelting-tier-4")

	--BRONZE
	OV.add_unlock("remelting-tier-1", "molten-bronze-remelting")
	--BRASS
	OV.add_unlock("remelting-tier-1", "molten-brass-remelting")
	--GUNMETAL
	OV.add_unlock("remelting-tier-1", "molten-gunmetal-remelting")
	--INVAR
	OV.add_unlock("remelting-tier-2", "molten-invar-remelting")
	--COBALT STEEL
	OV.add_unlock("remelting-tier-2", "molten-cobalt-steel-remelting")
	--NITINOL
	OV.add_unlock("remelting-tier-4", "molten-nitinol-remelting")
end