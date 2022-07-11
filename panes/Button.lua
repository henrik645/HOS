local Component = require("Component")

Button = Component:new {
    action = nil,
    label = nil,
}

function Button:watcher(stateVars)
    event, button, x, y = os.pullEvent("mouse_click")
    if x >= self.startX and x < self.endX and
        y >= self.startY and y < self.endY then
        self.action(stateVars)
    end
end

function Button:render(parent, dx, dy)
    local renderedSize = self.label:render(parent, dx, dy)
    -- define catchment area
    self.startX = dx
    self.endX = dx + renderedSize.width
    self.startY = dy
    self.endY = dy + renderedSize.height
    return renderedSize
end

return Button
