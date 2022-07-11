local Component = require("Component")

Stack = Component:new {
    spacing = 1,
    elements = {},
    bgColor = colors.white
}

-- function Stack:getSizeWhenRenderedAt(parent, dx, dy)
--     local width = parent.width -- stack takes up entire horizontal space given to it
--     local height = 0 -- height starts at 0 and counting up
--     for i, elem in ipairs(self.elements) do
--         height = height + elem:getSizeWhenRenderedAt(parent, dx, height)


function Stack:render(parent, dx, dy)
    self.w = self:makeWindow(parent, dx, dy)
    self.w.setBackgroundColor(self.bgColor)
    self.w.clear()
    local currY = 1
    for i, elem in ipairs(self.elements) do
        local renderedSize = elem:render(self.w, 1, currY)
        currY = currY + renderedSize.height + self.spacing
    end
    local windowWidth = self.w.getSize()
    self.resizeWindow(self.w, windowWidth, currY)
    return {width = self.w.width, height = currY}
end

return Stack
