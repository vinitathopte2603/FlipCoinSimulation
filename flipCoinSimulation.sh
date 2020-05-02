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
echo "Singlet Combination Percentage"
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
echo "Dooublet Combination Percentage"
for key in ${!resultDoublet[@]}
do
resultDoublet[$key]=$(((${resultDoublet[$key]}*100)/$numOfFlips))
printf "$key : ${resultDoublet[$key]}"
done
declare -A resultTriplet
resultTriplet+=( ["HHH"]=0 ["THH"]=0 ["HTH"]=0 ["HHT"]=0 ["TTH"]=0 ["THT"]=0 ["HTT"]=0 ["TTT"]=0 )
for (( i=1; i<=10; i++ ))
do
	flip=$((RANDOM%8))
	case $flip in
	0)
		((resultTriplet["HHH"]++))
		;;
	1)
		((resultTriplet["THH"]++))
		;;

	2)
		((resultTriplet["HTH"]++))
		;;
	3)
		((resultTriplet["HHT"]++))
		;;
	4)
		((resultTriplet["TTH"]++))
		;;
	5)
		((resultTrplet["THT"]++))
		;;
	6)
		((resultTriplet["HTT"]++))
		;;
	7)
		((resultTriplet["TTT"]++))
		;;
	*)
		;;
esac
done

echo ""
for key in ${!resultTriplet[@]}
do
resultTrplet[$key]=$(((${resultTriplet[$key]}*100)/$numOfFlips))
echo "$key : ${resultTriplet[$key]}"
done
