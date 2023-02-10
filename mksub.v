#!/usr/bin/vim -s 
:norm gg
:/: Node(.*)$
:norm jo// Building Subscriber
:norm o__subscriber_name__ = create_subscription<__interface__>(
:norm o"__topic__",__param__,
:norm ostd::bind(&__node_name__::__callback__, this, std::placeholders::_1));
:norm $vkk0=
:/: Node(.*)$
:norm j%o
:norm ovoid __callback__(const __interface__::SharedPtr msg)
:norm o{
:norm oRCLCPP_INFO(get_logger(), "Data: %d", msg->data);
:norm o}
:/private
:norm orclcpp::Subscription<__interface__>::SharedPtr __subscriber_name__;
:wq
