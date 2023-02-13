#!/usr/bin/vim -s

:norm GGo
:echo "Interface:\n" | read !head -n 1
:norm y$
:norm ggo
:norm 0d$i#include "
:norm "0p
:norm a.hpp"
:norm GG
:.s/\//::/g
:norm $bhvlU
:norm 0y$
:%s/__interface__/\=getreg('0')/g
:norm GGdd
:wq
