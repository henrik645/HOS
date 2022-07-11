Component = {
    width = 1,
    height = 1,
    x = 1,
    y = 1,
    dx = 0, -- horizontal offset from top left of parent element
    dy = 0, -- vertical offset from top left of parent element
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

function Component:adjustSize(constraints)
    self.width = constraints.maxWidth or self.width
    self.height = constraints.maxHeight or self.height
end

function Component:getSize()
    -- do nothing
end

function Component:handleMouseClick(click, state)
    -- do nothing
end

function Component:highlight(term, color)
    local color = color or colors.lightBlue
    for row = self.y, self.y + self.height do
        term.setCursorPos(self.x, row)
        term.setBackgroundColor(color)
        for col = self.x, self.x + self.width do
            term.write(" ")
        end
    end
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
