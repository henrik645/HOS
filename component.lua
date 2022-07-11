Component = {
    width = 1,
    height = 1,
    x = 1,
    y = 1,
    children = {}
}

function Component:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Component:draw(term, constraints)
    -- do nothing
end

function Component:getSize()
    -- do nothing
end

function Component:handleMouseClick(click, state)
    -- do nothing
end

function Component:isVisibleAt(x, y)
    return x >= self.x and x < (self.x + self.width) and
           y >= self.y and y < (self.y + self.height)
end

function Component:getChildAt(x, y)
    for i = 1, #self.children do
        local child = self.children[#self.children + 1 - i]
        if child:isVisibleAt(x, y) then
            return child
        end
    end
    return nil
end

return Component
