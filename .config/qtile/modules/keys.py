from libqtile.config import Group, Key
from libqtile.lazy import lazy
import modules.apps as apps

mod = "mod1"

keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),

    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key([mod], "r", lazy.spawn(apps.applicationMenu), desc="Spawn application"),

    Key([mod], "Return", lazy.spawn(apps.terminal), desc="Spawn default terminal"),
    Key([mod], "b", lazy.spawn(apps.browser), desc="Spawn default browser"),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(), desc="Switch to group"),
        Key([mod, 'Shift'], i.name, lazy.window.togroup(i.name, switch_group=True), desc="Switch window to group")
    ])
