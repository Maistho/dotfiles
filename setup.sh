#!/bin/bash
#should symlink all the things
from="`dirname \`which $0\``"
to=$HOME

echo installing from $from to $to

#vim
# vim should link to .vim
name=vim
src=$from/$name
link=$to/.$name
if [[ ! -h $link ]]; then
	ln -s $src $link
	echo linked $name
else
	echo $name is already linked
fi

#awesome
# awesome should link to ~/.config/awesome
name=awesome
src=$from/config/$name
link=$to/.config/$name
if [[ ! -h $link ]]; then
	ln -s $src $link
	echo linked $name
else
	echo $name is already linked
fi
