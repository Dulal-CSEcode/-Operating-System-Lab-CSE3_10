printf "Enter the total memory available (in Bytes): "
read ms

printf "Enter the block size (in Bytes): "
read bs

nob=$((ms / bs))
ef=$((ms - nob * bs))

printf "\nEnter the number of processes: "
read n
printf "\n"

# Initialize memory required array
mp=""

for ((i = 0; i < n; i++))
do
    printf "Enter memory required for process $((i + 1)) (in Bytes): "
    read mem_required
    mp="$mp$mem_required " 
done

printf "\nNo. of Blocks available in memory: $nob\n"
printf "\nPROCESS\tMEMORY REQUIRED\tALLOCATED\tINTERNAL FRAGMENTATION\n"

read -ra mp_arr <<< "$mp"

p=0
tif=0

for ((i = 0; i < n && p < nob; i++))
do
    printf "%d\t\t%d" "$((i + 1))" "${mp_arr[i]}"

    if [ "${mp_arr[i]}" -gt $bs ]
    then
        printf "\t\tNO\t\t---\n"
    else
        printf "\t\tYES\t\t$((bs - ${mp_arr[i]}))\n"
        tif=$((tif + bs - ${mp_arr[i]}))
        p=$((p + 1))
    fi
done

if [ $i -lt $n ]
then
    printf "\nMemory is Full, Remaining Processes cannot be accommodated.\n"
fi

printf "\nTotal Internal Fragmentation is %d\n" "$tif"
printf "Total External Fragmentation is %d\n" "$ef"
