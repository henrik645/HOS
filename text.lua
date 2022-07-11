local Component = require("component")

Text = Component:new {
    string = "",
    fgColor = colors.black,
    bgColor = colors.white
}

function Text:getSize(constraints)
    local width = math.min(constraints.maxWidth, string.len(self.string))
    local height = math.ceil(string.len(self.string) / constraints.maxWidth)
    return {width = width, height = height}
end

function Text:draw(term, constraints)
    local size = self:getSize(constraints)
    for i = 0, size.height - 1 do
        term.setCursorPos(self.x, self.y + i)
        term.setBackgroundColor(self.bgColor)
        term.setTextColor(self.fgColor)
        term.write(string.sub(self.string, i * size.width, (i + 1) * size.width))
    end
    self.width = size.width
    self.height = size.height
end

function Text:style(style)
    local ret = self
    if style == "button" then
        ret.fgColor = colors.white
        ret.bgColor = colors.black
    end
    return ret
end

return Text
