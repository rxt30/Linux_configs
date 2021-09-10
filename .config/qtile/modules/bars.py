from libqtile import bar, widget

primaryBar = bar.Bar([
    widget.GroupBox(),
    widget.WindowName(),
    widget.CurrentLayoutIcon()
], 30)

secondaryBar = bar.Bar([
    widget.GroupBox(),
    widget.WindowName()
], 30)
