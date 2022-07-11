local Window = require("Window")
local Stack = require("Stack")
local Text = require("Text")
local Desktop = require("Desktop")
local Padded = require("Padded")
local Button = require("Button")

local desktop = Desktop:new {
    windows = {
        Window:new {
            width = 25,
            height = 10,
            child = Padded:new { 
                wrapped = Stack:new {
                    spacing = 1,
                    -- bgColor = colors.purple,
                    elements = {
                        Text:new { string = "Hejsan" }:withStyle("header"),
                        Text:new { string = "Henrik" },
                        Button:new { label = Text:new{string = "OK"}:withStyle("button"), action = function() term.setBackgroundColor(colors.yellow); term.clear() end}
                        -- Text:new { string = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", bgColor = colors.red }
                    }
                }
            }
        }
    }
}

desktop:render(term.current(), 1, 1)
term.setCursorPos(1, 20)
term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.write("Does this work?")
