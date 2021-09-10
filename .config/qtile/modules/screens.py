from libqtile.config import Screen
import modules.bars as bars

screens = [
    Screen(bottom=bars.primaryBar),
    Screen(top=bars.secondaryBar),
    Screen(top=bars.secondaryBar),
]
