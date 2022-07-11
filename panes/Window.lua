local Component = require("Component")

Window = Component:new {
    borderColor = colors.yellow,
    bgColor = colors.white,
}

function Window:getSizeWhenRenderedAt()
    return {width = self.width, height = self.height}
end

-- renders this window inside parent window at dx, dy offset
-- returns width and height required for this render
function Window:render(parent, dx, dy)
    self.bw = window.create(parent, dx, dy, self.width, self.height) -- +1 because coordinates start at 1
    self.bw.setBackgroundColor(self.borderColor)
    self.bw.clear()
    self.cw = window.create(parent, dx + 1, dy + 1, self.width - 2, self.height - 2)
    self.cw.setBackgroundColor(self.bgColor)
    self.cw.clear()

    self.child:render(self.cw, 1, 1)

    return {width = self.width, height = self.height}
end

function Window:redraw()
    self.bw.redraw()
    self.cw.redraw()
end

return Window
