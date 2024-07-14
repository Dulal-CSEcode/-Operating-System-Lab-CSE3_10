#!/bin/bash

echo -n "Enter the number of processes: "
read n
echo ""

for ((i = 0; i < n; i++))
do
    p[$i]=$i
    echo -n "Enter Burst Time for Process P$i: "
    read bt[$i]
done

for ((i = 0; i < n; i++))
do
    for ((k = i + 1; k < n; k++))
    do
        if [ ${bt[$i]} -gt ${bt[$k]} ]
        then
            temp=${bt[$i]}
            bt[$i]=${bt[$k]}
            bt[$k]=$temp

            temp=${p[$i]}
            p[$i]=${p[$k]}
            p[$k]=$temp
        fi
    done
done

wtavg=0
tatavg=${bt[0]}
wt[0]=0
tat[0]=${bt[0]}

for ((i = 1; i < n; i++))
do
    wt[$i]=${tat[$((i-1))]}
    tat[$i]=$((wt[$i] + bt[$i]))
    wtavg=$((wtavg + wt[$i]))
    tatavg=$((tatavg + tat[$i]))
done

echo ""
echo -e "\tPROCESS \tBURST TIME \tWAITING TIME \tTURNAROUND TIME"

for ((i = 0; i < n; i++))
do
    echo -e "\tP${p[$i]} \t\t${bt[$i]} \t\t${wt[$i]} \t\t${tat[$i]}"
done

echo ""
echo "Average Waiting Time: $(echo "scale=2; $wtavg / $n" | bc)"
echo "Average Turnaround Time: $(echo "scale=2; $tatavg / $n" | bc)"
