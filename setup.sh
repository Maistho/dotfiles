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

#mopidy
# mopdy should link to ~/.config/mopidy/mopidy.conf
name=mopidy.conf
src=$from/config/$name
link=$to/.config/mopidy/$name
if [[ ! -h $link ]]; then
	ln -s $src $link
	echo linked $name
else
	echo $name is already linked
fi

#miscfiles
# miscfiles should link to ~/.file
src=$from/misc/*
for f in $src
do
	name=$(basename $f)
	link=$to/.$name
	if [[ ! -h $link ]]; then
		ln -s $f $link
		echo linked $name
	else
		echo $name is already linked
	fi
done
