#!/bin/sh

TERM=alacritty;	export TERM
EDITOR=vim;   	export EDITOR
PAGER=less;  	export PAGER

# aliases
[ -f ~/.aliases ] && . ~/.aliases
