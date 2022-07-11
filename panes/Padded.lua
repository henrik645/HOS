local Component = require("Component")

Padded = Component:new {
    amount = 1
}

function Padded:render(parent, dx, dy)
    local parentWidth, parentHeight = parent.getSize()
    self.w = window.create(parent, dx + self.amount, dy + self.amount, parentWidth - self.amount * 2, parentHeight - self.amount * 2)
    self.w.clear()
    return self.wrapped:render(self.w, 1, 1)
end

return Padded
