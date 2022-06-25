#!/bin/bash

#md5 encoder
#Main section

echo "[+] Md5 encoder";
echo "[+] Menu loading";
sleep 0.5;
enm=1
while [ $enm -gt 0 ]
do
	count=1
	echo "";
	echo -e "1. single encoder \n2. mass encoder \n3. remove junk from temp file \n4. clean-up temp file \n0. exit";
	echo "Waiting for your response....";
	read enm;
	sleep 0.5;
	case $enm in
		0)
		echo "";
		echo "ending..";
		sleep 0.5;
		;;
		1)
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
		2)
		echo "";
		echo "Enter the file name...";
		read fname;
		sleep 0.5;
		echo "reading batch from a file and encoding..."
		while read LINE ; do
		echo -n $LINE | md5sum >> /home/zero/Desktop/util/encoder/tempoutput.txt;
		done < $fname
		echo "done";
		;;
		3)
		echo "";
		echo "making temp file useable..";
		cd /
		cd /home/zero/Desktop/util/encoder
		cat tempoutput.txt | sed 's/...$//' > tempoutput1.txt
		cat tempoutput1.txt > tempoutput.txt
		rm tempoutput1.txt
		cat tempoutput.txt
		cd ..
		;;
		4)
		echo "this will clean the file.."
		cd /
		cd /home/zero/Desktop/util/encoder
		echo "clean-up";
		rm tempoutput.txt
		touch tempoutput.txt
		cd ..
		echo "";
		echo "done";
	esac
done

