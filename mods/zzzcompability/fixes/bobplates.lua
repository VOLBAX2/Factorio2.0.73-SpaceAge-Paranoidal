local Assert = require("__0zzzcompability__/utils/assert")

-- bobplates refers to bob-quartz in sand-processing's research_trigger which is removed by angels-refining
-- there i fix it by replacing original research recipe
local function FixSandProcessing()
	Assert(data.raw and data.raw.technology, "Expected data.raw.technology but it is nil")

	local tech = data.raw.technology["sand-processing"]
	Assert.AssertOutdated(tech, "sand-processing technology to fix not found")
	Assert.AssertOutdated(type(tech.research_trigger) == "table", "tech.research_trigger not table")
	Assert.AssertOutdated(tech.research_trigger.entity == "bob-quartz", "Expected bob-quartz as trigger's entity")

	tech.research_trigger = nil
	tech.prerequisites = { "automation-science-pack" }
	tech.unit = {
		count = 10,
		ingredients = {
			{ "automation-science-pack", 1 },
		},
		time = 10,
	}
end

FixSandProcessing()
