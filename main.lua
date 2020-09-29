inspect = require "inspect"
player = require "player"
    
-- immediately log output, never buffer
io.stdout:setvbuf("no")

local width, height = love.graphics.getDimensions()
local p = {}

function love.load()
    p = player:new()
end

function love.keypressed(key)
    p:keypressed(key)
end 

function love.update(dt)
    p:update(dt)
end

function love.draw()
    p:draw()
end
