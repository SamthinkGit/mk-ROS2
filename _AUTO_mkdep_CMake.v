#!/usr/bin/vim -s
:norm GGdd
:/set(dependencies
:/)
:norm kp==yw
:norm gg
:/find_package
:norm ofind_package( REQUIRED)
:norm $bbp
:wq
