local Component = require("component")

Window = Component:new{
    label = "Window",
    contentsWindow = nil,
    borderWindow = nil,
    state = {
        updated = false,
        vars = {}
    },
}

function Window:init()
    self.borderWindow = window.create(term.current(),
        self.x, self.y, self.width, self.height)
    self.contentsWindow = window.create(term.current(),
        self.x + 1, self.y + 1, self.width - 2, self.height - 2)
end 

function Window:getDescription()
    return "window with label " .. self.label
end

function Window:drawBorder()
    local bw = self.borderWindow
    bw.setTextColor(colors.white)

    -- background
    bw.setBackgroundColor(colors.yellow)
    bw.clear()

    -- toolbar
    bw.setCursorPos(1, 1) -- upper left corner
    bw.setBackgroundColor(colors.red)
    bw.write("X")

    bw.setCursorPos(self.width, 1)
    bw.setBackgroundColor(colors.green)
    bw.write("O")

    -- window title
    bw.setBackgroundColor(colors.yellow)
    bw.setTextColor(colors.black)
    local startPos = (self.width - string.len(self.label)) / 2 + 2
    bw.setCursorPos(startPos, 1)
    bw.write(self.label)
end

function Window:draw()
    local cw = self.contentsWindow
    local constraints = {
        maxWidth = self.width - 2, -- -2 to compensate for border width
        maxHeight = self.height - 2
    }

    self:drawBorder()
    cw.setBackgroundColor(colors.white)
    cw.clear()

    -- children
    for i = 1, #self.children do
        local component = self.children[i]
        component:draw(cw, constraints)
    end
end

function Window:handleMouseClick(click)
    local comp = self:getChildAt(click.x, click.y)
    if not (comp == nil) then
        comp.handleMouseClick(click, self.state)
        exit()
    end
end

return Window
