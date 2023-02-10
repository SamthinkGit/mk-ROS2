#!/bin/sh

# Test if the mksrc command is correct
if [ $# -ne 1 ]; then
  echo "mkpkg [SOURCE_NAME]"
  exit 0
fi

project_name=$(pwd | sed -E 's|.*/(.*)|\1|g')
# Make (if needed) the source dir where all the soruce codes must go 
mkdir -p src/$project_name
mkdir -p include/$project_name

# Build the source files
touch src/$project_name/$1.cpp
touch include/$project_name/$1.cpp

