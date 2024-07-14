#!/bin/bash

read -p "Enter the number of Blocks: " num_blocks

declare -a blocks
declare -a block_status
unused_blocks=$num_blocks

for (( i=0; i<num_blocks; i++ )); do
    read -p "Block $((i+1)) size: " size
    blocks[$i]=$size
    block_status[$i]=0
done

read -p "Enter the number of processes: " num_processes

declare -a processes
declare -a process_status
declare -a internal_fragmentation
total_internal_frag=0

for (( i=0; i<num_processes; i++ )); do
    read -p "Enter memory required for process $((i+1)): " size
    processes[$i]=$size
    process_status[$i]=0
done

echo -e "\nProcesses \tProcesses Size \tBlocks \tBlocks Size \tAllocated \tInt. Frag.\n"

for (( i=0; i<num_processes; i++ )); do
    allocated=0
    internal_frag=0
    for (( j=0; j<num_blocks; j++ )); do
        if (( ${processes[$i]} <= ${blocks[$j]} && ${block_status[$j]} == 0 )); then
            echo -e "$((i+1)) \t\t${processes[$i]} \t\t$j \t${blocks[$j]} \t\tYES \t\t$(( ${blocks[$j]} - ${processes[$i]} ))"
            block_status[$j]=1
            allocated=1
            internal_frag=$(( ${blocks[$j]} - ${processes[$i]} ))
            ((total_internal_frag += internal_frag))
            ((unused_blocks--))
            break
        fi
    done
    if (( allocated == 0 )); then
        echo -e "$((i+1)) \t\t${processes[$i]} \t- \t- \tNO \t-"
    fi
    internal_fragmentation[$i]=$internal_frag
done

echo -e "\nTotal Internal Fragmentation: $total_internal_frag\n"
echo -e "Number of Unused Blocks: $unused_blocks"

if (( unused_blocks > 0 )); then
    echo -e "\nUnused Blocks:"
    for (( i=0; i<num_blocks; i++ )); do
        if (( ${block_status[$i]} == 0 )); then
            echo -e "Block $((i+1)) size: ${blocks[$i]}"
        fi
    done
fi

exit 0

