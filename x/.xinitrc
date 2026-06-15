#!/bin/sh

# Load .Xresources
[ -r "$HOME/.Xresources" ] && xrdb -merge $HOME/.Xresources

# Load .xprofile manually
[ -r "$HOME/.xprofile" ] && . $HOME/.xprofile

# To fix GTK-4 start failure
xinitdir="/etc/X11/xinit"

if [ -d "$xinitdir"/xinitrc.d ] ; then
	for f in "$xinitdir/xinitrc.d"/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Load i3wm
exec i3
