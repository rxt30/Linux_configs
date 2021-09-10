from libqtile import layout

def getLayouts():
    layouts = [
            layout.Tile(border_focus='#d75f5f', ratio='0.5'),
            layout.Matrix(border_focus_stack='#d75f5f',),
            layout.Columns(border_focus_stack='#d75f5f'),
            layout.Floating(border_focus_stack='#d75f5f'),
            layout.Max()
            ]

    return layouts


