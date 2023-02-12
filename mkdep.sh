#!/bin/sh

# Test if the mkpkg command is correct
if [ $# -ne 1 ]; then
  echo "mkdep [DEPENDENCY_NAME]"
  exit 0
fi

dependencie=$1
echo $dependencie >> ./CMakeLists.txt 
echo $dependencie >> ./package.xml 
~/.mkscripts/_AUTO_mkdep_CMake.v ./CMakeLists.txt
~/.mkscripts/_AUTO_mkdep_XML.v ./package.xml

