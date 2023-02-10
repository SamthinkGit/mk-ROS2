#!/usr/bin/vim -s

:norm GG
:norm oint main(int argc, char * argv[])
:norm o{
:norm orclcpp::init(argc, argv);
:norm o
:norm oauto node = std::make_shared<__node_name__>();
:norm o
:norm orclcpp::spin(node);
:norm o
:norm orclcpp::shutdown();
:norm oreturn 0;
:norm o}
:norm %v%=
:wq
