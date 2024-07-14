total_memory=0
total_allocated=0
external_fragmentation=0
max_processes=10
process_count=0

echo "Enter the total memory available (in Bytes): "
read total_memory
echo ""

while :
do
    echo "Enter memory required for process $((process_count + 1)) (in Bytes): "
    read process_memory

    if (( process_memory <= (total_memory - total_allocated) )); then
        echo "Memory is allocated for Process $((process_count + 1))"
        (( total_allocated += process_memory ))
        process_memory_array[$process_count]=$process_memory
        (( process_count++ ))
    else
        echo "Memory is Full"
        break
    fi

    echo "Continue (y/n): "
    read ch
    if [ "$ch" == "n" ]; then
        break
    fi
done

echo ""
echo "Total Memory Available - $total_memory"
echo "PROCESS	MEMORY-ALLOCATED"

for (( j=0; j<process_count; j++ ))
do
    echo "$((j + 1))	${process_memory_array[$j]}"
done

external_fragmentation=$(( total_memory - total_allocated ))
echo ""
echo "Total memory allocated : $total_allocated"
echo "Total external fragmentation $external_fragmentation"
