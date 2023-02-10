#!/usr/bin/vim -s
:norm gg0i#include "rclcpp/rclcpp.hpp"
:norm gg
:norm iclass __node_name__ : public rclcpp::Node
:norm o{
:norm opublic:
:norm o__node_name__()
:norm o: Node("__public_node_name__")
:norm o{
:norm o}
:norm o
:norm oprivate:
:norm o
:norm o};

:wq
