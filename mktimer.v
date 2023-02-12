#!/usr/bin/vim -s
:norm gg
:/class
:norm Ousing namespace std::chrono_literals;
:/Node(.*)
:norm jo__timer__ = create_wall_timer(
:norm o__frequence__ms, std::bind(&__node_name__::timer_callback, this));
:norm gg
:/Node(.*)
:norm j%jovoid timer_callback()
:norm o{
:norm o}
:/private
:norm orclcpp::TimerBase::SharedPtr __timer__;
:wq
