sudo airmon-ng start wlp9s0

echo  "1 = BUjANGRESIDENCE";
echo  "2 = BUjANGRESIDENCE_plus";



read  -p "Pilih AP Target (1/2) :" monitor
#if [[ $monitor==2 ]]; then
#	target="50:64:2B:25:F8:AB";
#elif [[ $monitor == 1 ]]; then
#	target="98:DE:D0:BD:0F:E0";
#fi

case $monitor in
	1 )
		target="50:64:2B:25:F8:AB";;
	2 )
		target="50:64:2B:25:F8:AB";;
	3 )
		exit;;
esac
sudo airodump-ng --bssi $target mon0
