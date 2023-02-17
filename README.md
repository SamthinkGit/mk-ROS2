# mk-ros2
mk-ros2 is a set of vim-based development tools for faster ROS2 script generating. It includes commands for creating new packages, source files, cleaning source files from typos, and adding various ROS2 components such as nodes, main functions, publishers, subscribers...

## Installation
To install this tools yo must use the following steps:

1. **[Optional]** If you don't have vim installed you must download it. If you don't know if you have or not only type ```vim```. For installin vim you can use:
```bash
sudo apt install vim
```

2. Clone the repository
```bash
git clone https://github.com/SamthinkGit/mk-ROS2/edit/main/README.md
```

3. Install mk-ros2 tools
```bash
cd mk-ROS2
cd install
chmod +x *
./*.sh
```

_Note: All mk scripts will be saved in a .mkscripts directory at $HOME, if you want to change this, you can edit the MainDir in .mkSettings_

## Usage
The commands are all prefixed with mk and are explained in detail in the [wiki](https://github.com/SamthinkGit/mk-ROS2/wiki). The current tools available are:

- **mkpkg**: Builds a new package in the repository.
- **mksrc**: Builds a new source file inside a package.
- **pkgclean**: Cleans a source file from typos.
- **mkcat**: Terminal tool for applying mk implementations to a source file. With this tool, you can use node-targeted scripts such as:
  - **mknode**: Builds a new node.
  - **mkmain**: Adds a main function at the end.
  - **mkpub**: Adds a publication to a topic to the node.
 
  - **edit**: Replace tags with a new name
  
## Examples

Here's an example of how to develop a simple ROS2 node with mk-ros2
```bash
# Build a workspace
mkdir -p ws/src
cd ws/src

# Build a package
mkpkg MyNode rclcpp
cd MyNode/src

# Add some functionalities to the node
mkcat MyNode.cpp
[MK BUILDER] mknode
[MK BUILDER] mkmain
[MK BUILDER] w
```

With this done, you only should check the #include files inside the .cpp files and check that CMakeList.txt is properly installed.

```bash
# Tree Generated
.
└── src
    └── MyNode
        ├── CMakeLists.txt
        ├── include
        │   └── MyNode
        ├── package.xml
        └── src
            └── MyNode.cpp

5 directories, 3 files
```
```c++
// Node built
class __node_name__ : public rclcpp::Node
{
public:
__node_name__()
: Node("__public_node_name__")
{
}

private:

};
int main(int argc, char * argv[])
{
        rclcpp::init(argc, argv);

        auto node = std::make_shared<__node_name__>();

        rclcpp::spin(node);

        rclcpp::shutdown();
        return 0;
}
```
# Final Status of the workspace


## Contributions
We welcome contributions to this project! If you have an idea for a new feature or bug fix, please create an issue or a pull request.

## License
This project is licensed under the Apache License.
