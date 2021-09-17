#!/bin/sh

hdmiWorkspace=`swaymsg -t get_outputs | jq -r '.. | select(.name=="HDMI-A-1"?) | .current_workspace'`
dpWorkspace=`swaymsg -t get_outputs | jq -r '.. | select(.name=="DP-2"?) | .current_workspace'`
currentWorkspace=`swaymsg -t get_outputs | jq -r '.. | select(.name=="eDP-1"?) | .current_workspace'`

if [[ -n `pgrep vncviewer` ]] || [[ $1 == "kill" ]]; then
  pkill vncviewer;
  exit;
fi

if [[ -n $hdmiWorkspace ]]; then
  swaymsg 'workspace '$hdmiWorkspace'; exec vncviewer -Fullscreen=1 localhost; workspace '$currentWorkspace
  
fi

if [[ -n $dpWorkspace ]]; then
  swaymsg 'workspace '$dpWorkspace'; exec vncviewer -Fullscreen=1 localhost; workspace '$currentWorkspace
fi


