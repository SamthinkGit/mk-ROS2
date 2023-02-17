#!/bin/sh
# Check if cch is installed
command -v cch >/dev/null 2>&1 || { echo "ThirdParty CCH not installed. Aborting." >&2; exit 1; }

name=$(echo $1 | sed -E 's/(.*)\.cpp/\1/g')

cp $name.cpp old_$name.cpp
mv $name.cpp $name

cch --noLineNumbers --noBanner --ccExtension=cpp --hExtension=h -i $name
rm $name


