from libqtile import bar, widget

primaryBar = bar.Bar([
    widget.GroupBox(),
    widget.WindowName(),
    widget.KeyboardLayout(configured_keyboards=['de'])
], 30)

secondaryBar = bar.Bar([
    widget.GroupBox(),
    widget.WindowName()
], 30)
