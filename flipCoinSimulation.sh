#!/bin/bash -x

var="Welcome to flip coin simulator program"
echo "$var"

heads=1
flip=$(( RANDOM%2 ))
if [ $flip -eq $heads ]
then
	echo "Heads"
else
	echo "Tails"
fi
