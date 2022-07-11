local Component = require("component")

Desktop = Component:new {
    bgColor = colors.lightBlue
}

function Desktop:draw()
    term.setBackgroundColor(self.bgColor)
    term.clear()
    for n, window in pairs(self.children) do
        window:draw()
    end
end

function Desktop:init()
    self.width, self.height = term.getSize()
    for n, window in pairs(self.children) do
        window:init()
    end
end

-- returns the window at coordinates x, y
-- function Desktop:getWindowAt(x, y)
--     for i = 1, #self.windows do
--         local window = self.windows[#self.windows + 1 - i]
--         if window:isVisibleAt(x, y) then
--             return window
--         end
--     end
--     return nil
-- end

function Desktop:moveWindowToFront(window)
    for i = 1, #self.children do
        if self.children[i] == window then
            table.remove(self.children, i)
        end
    end
    table.insert(self.children, window)
end

function Desktop:handleMouseClick(click)
    local window = self:getChildAt(click.x, click.y)
    if not (window == nil) then
        window:handleMouseClick(click)
    end
end

return Desktop
