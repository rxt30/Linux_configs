killall -q polybar

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
