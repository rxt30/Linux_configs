from libqtile.config import Screen
import modules.bars as bars

def getScreens():
    screens = [
        Screen(top=bars.primaryBar),
        Screen(top=bars.secondaryBar),
        Screen(top=bars.secondaryBar),
    ]

    return screens
