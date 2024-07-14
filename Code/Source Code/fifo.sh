echo -n "Enter the number of processes: "
read n
echo ""

for ((i = 0; i < n; i++))
do
    echo -n "Enter the Burst Time for process $((i+1)): "
    read bt[$i]
done

wtavg=0
tatavg=${bt[0]} # Initialize tatavg to the first process's turnaround time
wt[0]=0
tat[0]=${bt[0]}

for ((i = 1; i < n; i++))
do
    wt[$i]=${tat[$((i-1))]}
    tat[$i]=$((bt[$i] + wt[$i]))
    wtavg=$((wtavg + wt[$i]))
    tatavg=$((tatavg + tat[$i]))
done

echo ""
echo "PROCESS       BURST TIME      WAITING TIME    TURNAROUND TIME"

for ((i = 0; i < n; i++))
do
    echo "P$i            ${bt[$i]}              ${wt[$i]}              ${tat[$i]}"
done

echo ""
echo "Average Waiting Time: $(echo "scale=2; $wtavg / $n" | bc)"
echo "Average Turnaround Time: $(echo "scale=2; $tatavg / $n" | bc)"
