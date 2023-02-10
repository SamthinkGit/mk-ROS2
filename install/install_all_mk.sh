#!/bin/sh
#file=$(cat ../.mkSettings | grep -E "MainDir=.*" | sed -E 's/.*=(.*)/\1/g')
#mkdir -p $file
#cp -r ../* $file

# TODO: implement full path setting
mkdir -p ~/.mkscripts
cp -r ../*.sh ~/.mkscripts
cp -r ../*.v ~/.mkscripts
file='~/.mkscripts'

echo '# MK Bash Scripts' >> ~/.bashrc
ls .. | grep -E '.*\.sh' | sed -E 's/\..*//g' | xargs -I% echo 'alias '%"=$file/"%'.sh' >> ~/.bashrc
ls .. | grep -E '.*\.v'  | sed -E 's/\..*//g' | xargs -I% echo 'alias '%"=$file/"%'.v' >> ~/.bashrc
chmod +x ~/.mkscripts/*.sh
chmod +x ~/.mkscripts/*.v
