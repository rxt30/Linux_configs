if [ "$XDG_SESSION_DESKTOP" = "sway" ] ; then
    # https://github.com/swaywm/sway/issues/595
    export _JAVA_AWT_WM_NONREPARENTING=1
  export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
fi

if [ "$XDG_SESSION_DESKTOP" = "awesome" ] ; then
  export XDG_CURRENT_DESKTOP=LXQt
fi
