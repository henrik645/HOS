local Component = require("component")

HStack = Component:new {
    spacing = 1,
    align = "left"
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

function HStack:draw(term, constraints)
    local currY = self.y
    local maxWidth = 0
    local size = self:getSize(constraints)
    local stackWidth = size.width

    for i = 1, #self.children do
        local child = self.children[i]
        if self.align == "left" then
            child.x = self.x
        elseif self.align == "center" then
            child.x = self.x + (stackWidth - child:getSize(constraints).width) / 2
        end
        if child.width > maxWidth then
            maxWidth = child.width
        end
        child.y = currY
        currY = currY + child.height + self.spacing
        child:draw(term, constraints)
    end

    self.height = size.height
    self.width = size.width
end

return HStack
