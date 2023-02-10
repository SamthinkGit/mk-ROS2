#!/usr/bin/vim -s

:norm gg
:/: Node(.*)$
:norm jo// Building Publisher
:norm o__publisher_name__ = create_publisher<__interface_type__>("__topic__",__param__);
:/private
:norm orclcpp::Publisher<__interface_type__>::SharedPtr __publisher_name__;
:norm ==
:wq
