#!/usr/bin/vim -s

:norm gg
:/: Node(.*)$
:norm jo// Building Publisher
:norm o__publisher_name__ = create_publisher<__interface__>("__topic__",__buffer_size__);
:/private
:norm orclcpp::Publisher<__interface__>::SharedPtr __publisher_name__;
:norm ==
:wq
