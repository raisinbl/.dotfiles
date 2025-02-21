#!/bin/sh

TERM=alacritty;	export TERM
EDITOR=vim;   	export EDITOR
PAGER=less;  	export PAGER

# aliases
[ -f ~/.aliases ] && . ~/.aliases

# Wayland
export ELECTRON_OZONE_PLATFORM_HINT="auto"

export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx
