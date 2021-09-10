from libqtile import bar, widget

primaryBar = bar.Bar([
    widget.GroupBox(),
    widget.Battery(),
    widget.BatteryIcon(),
    widget.CPU(),
    widget.Memory(),
    widget.PulseVolume(),
    widget.Systray(),
    widget.Clock(),
    widget.CurrentLayoutIcon()
], 30)

secondaryBar = bar.Bar([
    widget.GroupBox(),
    widget.WindowName()
], 30)
