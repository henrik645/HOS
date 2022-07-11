local w = window.create(term.current(), 5, 5, 10, 10)
w.setBackgroundColor(colors.white)
w.clear()
event, button, x, y = os.pullEvent("mouse_click")
print(x, y)

