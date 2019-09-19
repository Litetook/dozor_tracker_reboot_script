#!/bin/bash
ping_test=$(</root/script/test_network.txt);
ping -c4 8.8.8.8;
if [ $? -eq 0 ]; then
	echo "ping good";
	ping_test=0;
	echo $ping_test>/root/script/test_network.txt;

else
    	ping_test=$((ping_test+1));
    	echo $ping_test>/root/script/test_network.txt;
	#set default connect to network with modem
    	/sbin/dhclient -v eth1;
	#del dafault route, set new route 192.168.1.1
    	ip route del default ; ip route add default via 192.168.1.1;
   	echo restart network finished;
	echo REBOOT CODE $ping_test;
fi



if [ $ping_test -eq 5 ];
then
ping_test=0;
echo $ping_test>/root/script/test_network.txt;
/sbin/reboot
fi





