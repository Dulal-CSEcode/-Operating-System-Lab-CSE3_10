#!/bin/bash

echo -n "Enter the number of processes: "
read n
echo ""

for ((i = 0; i < n; i++))
do
    echo -n "Enter Burst Time for process $((i + 1)): "
    read bt[$i]
    echo -n "Enter Priority for process $((i + 1)): "
    read pr[$i]
    p[$i]=$((i + 1)) # Contains process number
done

for ((i = 0; i < n; i++))
do
    pos=$i
    for ((j = i + 1; j < n; j++))
    do
        if [ ${pr[$j]} -lt ${pr[$pos]} ]; then
            pos=$j
        fi
    done

    temp=${pr[$i]}
    pr[$i]=${pr[$pos]}
    pr[$pos]=$temp

    temp=${bt[$i]}
    bt[$i]=${bt[$pos]}
    bt[$pos]=$temp

    temp=${p[$i]}
    p[$i]=${p[$pos]}
    p[$pos]=$temp
done

wt[0]=0

# Calculate waiting time
for ((i = 1; i < n; i++))
do
    wt[$i]=0
    for ((j = 0; j < i; j++))
    do
        wt[$i]=$((wt[$i] + bt[$j]))
    done
done

# Calculate turnaround time
total_wt=0
total_tat=0
for ((i = 0; i < n; i++))
do
    tat[$i]=$((bt[$i] + wt[$i]))
    total_wt=$((total_wt + wt[$i]))
    total_tat=$((total_tat + tat[$i]))
done

avg_wt=$(echo "scale=2; $total_wt / $n" | bc)
avg_tat=$(echo "scale=2; $total_tat / $n" | bc)

echo ""
echo "PROCESS       BURST TIME      WAITING TIME    TURNAROUND TIME"

for ((i = 0; i < n; i++))
do
    echo "P${p[$i]}            ${bt[$i]}              ${wt[$i]}              ${tat[$i]}"
done

echo ""
echo "Average Waiting Time: $avg_wt"
echo "Average Turnaround Time: $avg_tat"
