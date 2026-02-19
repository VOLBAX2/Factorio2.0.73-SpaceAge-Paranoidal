---@meta

---@class (exact) MapPositionStruct
---@field x number
---@field y number
MapPositionStruct = {}

---@alias MapPosition MapPositionStruct | number[]

---@alias FluidID string
---@alias FlowDirection "input-output" | "input" | "output"

---@class PipeConnectionDefinition
---@field flow_direction? FlowDirection
---@field direction? defines.direction
---@field position? MapPosition
PipeConnectionDefinition = {}

---@class FluidBox
---@field volume number must be positive
---@field pipe_connections PipeConnectionDefinition[]
---@field filter? FluidID Can be used to specify which fluid is allowed to enter this fluid box
FluidBox = {}

---@class BoundingBox
---@field left_top MapPosition 
---@field right_bottom MapPosition 
BoundingBox = {}
