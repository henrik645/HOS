local Component = require("component")

HStack = Component:new {
    spacing = 1,
    align = "left",
    bgColor = colors.white,
}

function HStack:getSize(constraints)
    local maxWidth = 0
    local height = 0
    for i = 1, #self.children do
        local child = self.children[i]
        local childSize = child:getSize(constraints)
        if childSize.width > maxWidth then
            maxWidth = childSize.width
        end
        height = height + childSize.height
    end

    return { width = maxWidth, height = height }
end

function HStack:draw(parentElem, constraints)
    self:adjustSize(constraints)
    local size = self:getSize(constraints)
    local w = window.create(parentElem, self.dx, self.dy, self.width, self.height)
    local currY = 1
    for i, child in ipairs(self.children) do
        child:adjustSize(constraints)
        if self.align == "left" then
            child.dx = 0
        elseif self.align == "center" then
            child.dx = math.ceil((size.width - child.width) / 2)
        end
        currY = currY + child.height + self.spacing
        childConstraints = {maxWidth = w.width, maxHeight = w.height}
        term.setCursorPos(5, 5)
        child:draw(w, childConstraints)
    end

    -- local currY = self.y
    -- local maxWidth = 0
    -- local size = self:getSize(constraints)
    -- local stackWidth = size.width
    -- stackWidth = constraints.maxWidth

    -- for i = 1, #self.children do
    --     local child = self.children[i]
    --     local childSize = child:getSize(constraints)
    --     if self.align == "left" then
    --         child.x = self.x
    --     elseif self.align == "center" then
    --         child.x = self.x + math.ceil((stackWidth - child:getSize(constraints).width) / 2)
    --     end
    --     if child.width > maxWidth then
    --         maxWidth = child.width
    --     end
    --     child.y = currY
    --     currY = currY + childSize.height + self.spacing
    --     child:draw(term, constraints)
    -- end

    -- self.height = size.height
    -- self.width = size.width
end

return HStack
