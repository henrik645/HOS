local Component = require("component")

PaddedView = Component:new {
    padding = 1,
    wrapped = nil
}

function PaddedView:getSize(constraints)
    constraints.maxWidth = constraints.maxWidth - self.padding * 2
    constraints.maxHeight = constraints.maxHeight - self.padding * 2
    local size = self.wrapped:getSize(constraints)
    size.width = size.width + self.padding * 2
    size.height = size.height + self.padding * 2
    return size
end

function PaddedView:draw(term, constraints)
    self.wrapped.x = self.x + self.padding
    self.wrapped.y = self.y + self.padding
    constraints.maxWidth = constraints.maxWidth - self.padding * 2
    constraints.maxHeight = constraints.maxHeight - self.padding * 2
    self.wrapped:draw(term, constraints)
    self.width = self.wrapped.width + self.padding * 2
    self.height = self.wrapped.height + self.padding * 2
end

return PaddedView
