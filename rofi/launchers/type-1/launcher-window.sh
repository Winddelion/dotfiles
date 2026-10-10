#!/usr/bin/env bash

dir="$HOME/.config/rofi/launchers/type-1"
theme='style-2'

## Run
rofi \
    -show window \
    -theme ${dir}/${theme}.rasi

