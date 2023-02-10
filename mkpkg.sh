#!/bin/sh

# Test if the mkpkg command is correct
if [ $# -lt 2 ]; then 
	echo "mkpkg [PKG_NAME] [DEPENDENCIES...]"
	exit 0
fi

#Save the name of the package
pkg_name=$1
shift


# Build a package
ros2 pkg create $pkg_name --dependencies $@
cd $pkg_name/src
touch $pkg_name.cpp

# Editing cmake
dependence="set(dependencies"
for i; do
	dependence="$dependence\n$i"
done
dependence="$dependence\n)"
executable="add_executable($pkg_name src/$pkg_name.cpp)\nament_target_dependencies($pkg_name \${dependencies})"
install="install(TARGETS\n  $pkg_name\n  ARCHIVE DESTINATION lib\n  LIBRARY DESTINATION lib\n  RUNTIME DESTINATION lib/\${PROJECT_NAME}\n)"

cd ..
sed "11 i $dependence\n\n$executable\n\n$install\n" CMakeLists.txt > tempT
rm CMakeLists.txt
mv tempT CMakeLists.txt
vim CMakeLists.txt -c ":norm ggvGG=" -c ":wq"

cd ..
echo "---------- PACKAGE $pkg_name SUCCESFULLY INSTALLED ----------\n"
exit 0
