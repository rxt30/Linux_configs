import subprocess
import os

from libqtile import hook
from modules.layouts import getLayouts
from modules.screens import getScreens
from modules.keys import getKeys

@hook.subscribe.startup
def dbus_registr():
    id = os.environ.get('DESKTOP_AUTOSTART_ID')
    if not id:
        return
    subprocess.Popen([
        'dbus-send',
        '--session',
        '--print-reply',
        '--dest=org.gnome.SessionManager',
        '/org/gnome/SessionManager',
        'org.gnome.SessionManager.RegisterClient',
        'string:qtile',
        'string:' + id
        ])

layouts = getLayouts()
keys = getKeys() 
screens = getScreens()
