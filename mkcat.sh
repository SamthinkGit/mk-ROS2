#!/bin/sh

# Test if the mkpkg command is correct
if [ $# -ne 1 ]; then
  echo "mkpkg [FILE_NAME]"
  exit 0
fi

save_action="w"
exit_action="x"

touch $1
cat $1 > .mkbuild
touch .mkbuild

while true; do

  clear
  echo "--------- ROS BUILDER -------- "
  grep --color -E '|__([a-z]*_*)+__|' .mkbuild
  echo -n '[ROS Builder] '
  read next_action
  
  if [ "$next_action" = "$exit_action" ]; then
    rm .mkbuild
    break
  fi
  
  if [ "$next_action" = "$save_action" ]; then
    cat .mkbuild > $1
    rm .mkbuild
    break
  fi

  if [ "$next_action" = "edit" ]; then
    echo -n '[Tag]: '
    read value
    echo -n '[Replace]: '
    read new_value
    vim -c ":%s/$value/$new_value/gc" -c ":wq" .mkbuild
  fi

  if [ "$next_action" = "help" ]; then
	  ls ~/.mkscripts | grep -E '[^.]*\.v$' | less
  fi

  if [ "$next_action" = "vim" ]; then
    vim .mkbuild
  fi
  ~/.mkscripts/$next_action.v .mkbuild
done
echo "------------------------------ "
