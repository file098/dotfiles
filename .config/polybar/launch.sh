#! /bin/bash

killall -q polybar

sleep 1; polybar --reload bar1 &

echo "launched polybar"
