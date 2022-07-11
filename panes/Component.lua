Component = {
    children = {}
}

function Component:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

-- default window creation that can be overridden,
-- creates window that takes up rest of parent display from dx, dy (moving to bottom right)
function Component:makeWindow(parent, dx, dy)
    local parentWidth, parentHeight = parent.getSize()
    return window.create(parent, dx, dy, parentWidth, parentHeight) -- +1 because coordinates start at 1
end 

function Component.resizeWindow(win, width, height)
    local x, y = win.getPosition()
    win.reposition(x, y, width, height)
end

return Component
