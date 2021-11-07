#!/bin/bash

if [ -z "$1" ]
then
	echo "IP address from VM needed"
else
	mkdir ./hidden-folder ; cd ./hidden-folder
	wget -np -r -A "README*" -nd -l 0 -e robots=off http://$1/.hidden/
    readme_amount=`ls | grep README | wc -l`
    index=$(($readme_amount-1))
    while [ $index != 0 ]
    do
        readme="README.$index"
        str=`cat $readme | grep '[0-9]'`
        printf "%s" $str
        index=$(($index-1))
    done
    printf "\nDone !\n"
fi