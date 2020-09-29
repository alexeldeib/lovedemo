local _M = {
    x = 0,
    y = love.graphics.getHeight() - 50,
    dx_default = 50,
    dy_default = 0,
    dx = 50,
    dy = 0,
    width = 50,
    height = 50,
    window_bottom = love.graphics.getHeight(),
    window_right = love.graphics.getWidth(),
}

local jump_speed = 800
local gravity = 2400

function _M:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function _M:keypressed(key) 
    if key == "space" then
        self.dy = self.dy - jump_speed
    end
end


function _M:update(dt)
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        self.x = self.x - self.dx * dt
    end
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        self.x = self.x + self.dx * dt
    end
    -- if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
    --     self.y = self.y - self.dy * dt
    -- end
    -- if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
    --     self.y = self.y + self.dy * dt
    -- end
    self.y = self.y + self.dy * dt
    if self.y > self.window_bottom - self.height then
        self.y = self.window_bottom - self.height
        self.dy = 0
    end
    if self.y < self.window_bottom - self.height then
        self.dy = self.dy + gravity * dt
    end
end

function _M:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

-- function detectCollision(a, b)
--     local a_left = a.x
--     local a_right = a.x + a.width 
--     local a_top = a.y
--     local a_bottom = a.y + a.height
    
--     local b_left = b.x
--     local b_right = b.x + b.width 
--     local b_top = b.y
--     local b_bottom = b.y + b.height

--     if a_right > b_left and a_left < b_right and a_bottom < b_top and a_top > b_bottom then
--         return true
--     end

    
-- end

return _M
