#!/bin/bash

vol="$(amixer -Dhw:0 get Front|grep Left:|awk -F'[][]' '{ print $2 }')"
if [ ${vol} == "0%" ]; then
    amixer -Dhw:0 set Front 100%
    amixer -Dhw:0 set Headphone 0%
    notify-send -t 2000 喇叭
else
    amixer -Dhw:0 set Front 0%
    amixer -Dhw:0 set Headphone unmute
    amixer -Dhw:0 set Headphone 100%
    notify-send -t 2000 耳機
fi
