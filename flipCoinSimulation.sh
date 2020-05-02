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

declare -A resultDoublet
resultDoublet+=( ["HH"]=0 ["TT"]=0 ["HT"]=0 ["TH"]=0 )

for (( i=1;i<=$numOfFlips;i++ ))
do
	flip=$(( RANDOM%4 ))
	case $flip in
		0)
			((resultDoublet["HH"]++))
		;;
		1)
			((resultDoublet["TT"]++))
		;;
		2)
			((resultDoublet["HT"]++))
		;;
		3)
			((resultDoublet["TH"]++))
		;;
		*)
		;;
	esac
done
for key in ${!resultDoublet[@]}
do
resultDoublet[$key]=$(((${resultDoublet[$key]}*100)/$numOfFlips))
printf "$key : ${resultDoublet[$key]}"
done
