local Component = require("component")

Button = Component:new {
    label = nil,
    action = nil
}

function Button:draw(term, constraints)
    if not (self.label == nil) then
        self.label.x = self.x
        self.label.y = self.y
        self.label:draw(term, constraints)
        self.width = self.label.width
        self.height = self.label.height
    end
end

function Button:getSize(constraints)
    return self.label:getSize(constraints)
end

function Button:handleMouseClick(click, state)
    if not self.action == nil then
        self.action(click, state)
    end
end

return Button
