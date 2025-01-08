#!/bin/bash
# i3 xrandr configuration bash script
# Sets the second monitor above of the laptop monitor
# reset everything
$(eval "xrandr --auto")

list_monitors="xrandr --listmonitors | grep Monitors | awk '{print $2}'"
monitors=$(eval "$list_monitors" | awk '{print $2}')

if [ $monitors == 2 ]; then
  # echo "Your monitors are $monitors"
  # echo "Monitor 1: "
  monitor_1=$(eval "xrandr --listmonitors | grep 0: " | awk '{print $4}')
  monitor_2=$(eval "xrandr --listmonitors | grep 1: " | awk '{print $4}')
  # echo "Monitor 1 is $monitor_1"
  # echo "Monitor 2 is $monitor_2"
  setup="xrandr --output $monitor_2 --above $monitor_1"
  # echo "$setup"
  ex_code=$(eval $setup)
  setup_res="xrandr --output $monitor_2"
  ex_code=$(eval $setup_res)
elif [ $monitors == 1 ]; then
  xrandr_auto="xrandr --auto"
  $(eval $xrandr_auto)
fi
