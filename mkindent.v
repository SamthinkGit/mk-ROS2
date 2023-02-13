#!/usr/bin/vim -s

:norm ggvGG=
:norm gg
:/class
:/{
:norm v%<
:wq
