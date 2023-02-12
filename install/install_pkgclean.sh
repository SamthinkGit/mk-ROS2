#!/bin/bash
# Auto Package Cleaning tool
# Author: SamthinkGit
# Checks:
# -> Free spaces
# -> Indentation
# -> Tabs
# -> Some missplaced {}

# ---- How to use pkgclean -----
# -> Install the tool with ./install_pkgclean.sg
# -> Reload the terminal
# -> pkgclean [file_to_clean.cpp]

# Warning: Indentation could not work when ommiting {}

# Setting auto indent tools
echo "\" Vim Cleaning tool" >> ~/.vimrc
echo 'set tabstop=2' >> ~/.vimrc
echo 'set shiftwidth=2' >> ~/.vimrc
echo 'set expandtab' >> ~/.vimrc
echo 'set smartindent' >> ~/.vimrc

# Generating cleaning macro
echo -E 'let @0="/{\ny$GG$p:%s/^[ \\t]*$//g\n:%s/ *$//g\n:%s/\\([^ ]\\){$/\\1\\r{/g\nggvGG$=GGdd"' >> ~/.vimrc

# Adding pkgclean command
echo "# Vim Cleaning tool" >> ~/.bashrc
echo "alias pkgclean='vim -c \":norm @0\" -c \":wq\"'" >> ~/.bashrc 


# -------- HOW TO UNINSTALL ---------
# Just remove VimCleaning tools from the following files:
# ~/.bashrc
# ~/.vimrc
