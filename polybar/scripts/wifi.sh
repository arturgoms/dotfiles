#!/bin/bash

open () {
	alacritty -e nmtui &
}

close () {
	killall alacritty -e nmtui &
}

pgrep nmtui || alacritty -e nmtui
