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
if [[ -h $link ]]; then
	echo $name is already linked
elif [[ -e $link ]]; then
	echo $name exists. You need to remove/rename it before linking.
else
	ln -s $src $link && echo linked $name
fi

#atom
# atom should link to ~/.atom
name=atom
src=$from/$name
link=$to/.$name
if [[ -h $link ]]; then
	echo $name is already linked
elif [[ -e $link ]]; then
	echo $name exists. You need to remove/rename it before linking.
else
	ln -s $src $link && echo linked $name
fi

#awesome
# awesome should link to ~/.config/awesome
name=awesome
src=$from/config/$name
link=$to/.config/$name
if [[ -h $link ]]; then
	echo $name is already linked
elif [[ -e $link ]]; then
	echo $name exists. You need to remove/rename it before linking.
else
	ln -s $src $link && echo linked $name
fi

#mopidy
# mopdy should link to ~/.config/mopidy/mopidy.conf
name=mopidy.conf
src=$from/config/$name
link=$to/.config/mopidy/$name
if [[ -h $link ]]; then
	echo $name is already linked
elif [[ -e $link ]]; then
	echo $name exists. You need to remove/rename it before linking.
else
	ln -s $src $link && echo linked $name
fi

#beets
# beets should link to ~/.config/beets
name=beets
src=$from/config/$name
link=$to/.config/$name
if [[ -h $link ]]; then
	echo $name is already linked
elif [[ -e $link ]]; then
	echo $name exists. You need to remove/rename it before linking.
else
	ln -s $src $link && echo linked $name
fi

#miscfiles
# miscfiles should link to ~/.file
src=$from/misc/*
for f in $src
do
	name=$(basename $f)
	link=$to/.$name
	if [[ -h $link ]]; then
		echo $name is already linked
	elif [[ -e $link ]]; then
		echo $name exists. You need to remove/rename it before linking.
	else
		ln -s $f $link && echo linked $name
	fi
done
