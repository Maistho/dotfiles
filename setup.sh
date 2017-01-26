#!/bin/bash

#quit if something fails
set -e

#should symlink all the things
get_script_dir () {
     SOURCE="${BASH_SOURCE[0]}"
     # While $SOURCE is a symlink, resolve it
     while [ -h "$SOURCE" ]; do
          DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
          SOURCE="$( readlink "$SOURCE" )"
          # If $SOURCE was a relative symlink (so no "/" as prefix, need to resolve it relative to the symlink base directory
          [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
     done
     DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
     echo "$DIR"
}
from=$(get_script_dir)
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

#ssh
# ssh config should link to ~/.ssh/config
src=$from/sshconfig
name=sshconfig
link=$to/.ssh/config
if [[ -h $link ]]; then
	echo $name is already linked
elif [[ -e $link ]]; then
	echo $name exists. You need to remove/rename it before linking.
else
	ln -s $src $link && echo linked $name
fi
