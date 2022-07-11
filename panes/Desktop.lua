local Component = require("Component")

Desktop = Component:new {
    bgColor = colors.lightBlue,
    windows = {}
}

function Desktop:render(parent, dx, dy)
    self.w = parent
    self.w.setBackgroundColor(self.bgColor)
    self.w.clear()
    for i, window in ipairs(self.windows) do
        window:render(self.w, 5, 5)
    end
end

return Desktop
