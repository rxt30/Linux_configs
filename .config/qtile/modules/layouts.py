from libqtile import layout

def getLayouts():
    layouts = [
            layout.Columns(border_focus_stack='#d75f5f'),
            layout.Tile(border_focus='#d75f5f'),
            layout.Matrix(border_focus_stack='#d75f5f',),
            layout.Floating(border_focus_stack='#d75f5f'),
            layout.Max()
            ]

    return layouts


