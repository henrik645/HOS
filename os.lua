local Desktop = require("desktop")
local Window = require("windows")
local Button = require("button")
local Text = require("Text")
local HStack = require("hstack")
local PaddedView = require("paddedview")

local appWindow = Window:new {
    x = 5,
    y = 5,
    width = 25,
    height = 15,
    label = "win1"
}

local appWindow2 = Window:new {
    x = 10,
    y = 8,
    width = 25,
    height = 10,
    label = "win2"

}

local button1 = Button:new {
    label = Text:new{string = "hejsan"}:style("button"),
    action = function (click, state)
        state.vars.clicked = true
    end
}

local text1 = Text:new {
    string = "test",
}

local text2 = Text:new { string = "testing123"}

local stack = HStack:new {
    align = "center",
    children = {
        button1,
        text1,
        text2,
    }
}

local stack2 = HStack:new {
    -- x = 10,
    -- y = 2,
    align = "left",
    children = {
        HStack:new {
            align = "left",
            children = {
                Text:new { string = "Hejsan jag heter Henrik och det har ar en lang string hejsafasdf" },
                Text:new { string = "Click OK" }
            }
        },
        -- PaddedView:new { wrapped = Text:new { string = "Click Cancel" }}
        Text:new { string = "Click Cancel" }
    }
}

appWindow.children = { PaddedView:new{wrapped = stack2} }
-- appWindow.children = {stack2}

local desktop = Desktop:new {
    children = {
        appWindow,
        -- appWindow2
    }
}

desktop:init()
desktop:draw()

while true do
    local event, button, x, y = os.pullEvent("mouse_click")
    local window = desktop:getChildAt(x, y)
    desktop:moveWindowToFront(window)
    desktop:draw()
    local click = {
        event = event,
        button = button,
        x = x,
        y = y
    }
    desktop:handleMouseClick(click)
end
