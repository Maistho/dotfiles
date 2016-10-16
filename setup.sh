#!/bin/bash

#quit if something fails
set -e

#should symlink all the things
from="`dirname \`command -v $0\``"
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


#config
# files in config should link to ~/.config/filename
src=$from/config/*
for f in $src
do
	name=$(basename $f)
	link=$to/.config/$name
	if [[ -h $link ]]; then
		echo $name is already linked
	elif [[ -e $link ]]; then
		echo $name exists. You need to remove/rename it before linking.
	else
		ln -s $f $link && echo linked $name
	fi
done

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
