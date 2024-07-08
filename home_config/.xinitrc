#!/bin/sh

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -f ~/.xprofile ] && . ~/.xprofile

exec /usr/bin/awesome
