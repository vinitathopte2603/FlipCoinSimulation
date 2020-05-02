#!/bin/bash -x

var="Welcome to flip coin simulator program"
echo "$var"

heads=1
headsCount=0
numOfFlips=10
declare -A resultSinglet
for (( i=1;i<=$numOfFlips;i++ ))
do
flip=$((RANDOM%2))
	if [ $flip -eq $heads ]
	then
		((headsCount++))
	else
		((tailsCount++))
	fi
done
resultSinglet["Heads"]=$((($headsCount*100)/$numOfFlips))
resultSinglet["Tails"]=$((($tailsCount*100)/$numOfFlips))
echo ${!resultSinglet[@]}
echo ${resultSinglet[@]}
