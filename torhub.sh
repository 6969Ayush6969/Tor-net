#!/bin/bash
txtred='\e[31m' # Red
txtgrn='\e[32m' # Green
txtylw='\e[33m' # Yello
txtcyn='\e[36m' # Cyan
txtwht='\e[37m' #white
time="$(date +"%T")"
if [ "$EUID" -eq 0 ]
 then 
 	echo -e "$txtgrn Checking python3 packages $txtwht"
  	chmod +x ./build.sh
	./build.sh
	echo  -e "$txtgrn $time $txtcyn Changing IP $txtwht"
	python3 ./torghost.py -s
	echo -e "$txtgrn $time $txtcyn Changed IP $txtwht"
	echo  -e"$txtgrn $time $txtcyn Changing MAC Adress $txtwht"
	macchanger -r eth0
	macchanger -r eth0
	macchanger -r eth0
	echo -e "$txtgrn $time $txtcyn Changed MAC Adress $txtwht"
	ifconfig
	exit
else
	echo -e "$txtred ERROR: User Not In Sudo privileges \n$txtylw Use magic word 'sudo su'$txtwht"
	exit
fi
