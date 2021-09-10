from libqtile import layout

def getLayouts():
    layouts = [
            layout.Matrix(border_focus_stack='#d75f5f'),
            layout.Columns(border_focus_stack='#d75f5f'),
            layout.Floating(border_focus_stack='d75f5f'),
            layout.Max()
            ]

    return layouts


