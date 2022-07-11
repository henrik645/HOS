local Component = require("Component")

Text = Component:new {
    string = "",
    fgColor = colors.black,
    bgColor = colors.white
}

function Text:render(parent, dx, dy)
    self.w = window.create(parent, dx, dy, string.len(self.string), 1)
    self.w.setBackgroundColor(self.bgColor)
    self.w.setTextColor(self.fgColor)
    self.w.clear()
    self.w.write(self.string)
    return {width = string.len(self.string), height = 1}
end

function Text:withStyle(style)
    local ret = self
    if style == "header" then
        ret.fgColor = colors.white
        ret.bgColor = colors.black
    elseif style == "button" then
        ret.fgColor = colors.white
        ret.bgColor = colors.blue
    end
    return ret
end

return Text
