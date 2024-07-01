# see https://unix.stackexchange.com/a/295652/332452
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

export SSH_AUTH_SOCK

# see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME"/.local/share/keyrings

dbus-update-activation-environment --all

eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets) > /dev/null

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

exec /usr/bin/awesome
