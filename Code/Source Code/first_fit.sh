#!/bin/bash

# Initialize arrays and variables
declare -a frag
declare -a b
declare -a f
declare -a bf
declare -a ff
nb=0
nf=0
allocated_files=0
total_internal_frag=0

echo -e "\t\tFirst Fit"
read -p "Enter the number of blocks: " nb
read -p "Enter the number of files: " nf

echo -e "\nEnter the size of the blocks:-"
for ((i = 1; i <= nb; i++)); do
    read -p "Block $i: " b[$i]
done

echo -e "\nEnter the size of the files:-"
for ((i = 1; i <= nf; i++)); do
    read -p "File $i: " f[$i]
done

# Allocate files to blocks
for ((i = 1; i <= nf; i++)); do
    for ((j = 1; j <= nb; j++)); do
        if [[ ${bf[$j]} -ne 1 ]]; then
            temp=$((b[$j] - f[$i]))
            if [[ $temp -ge 0 ]]; then
                ff[$i]=$j
                frag[$i]=$temp
                bf[${ff[$i]}]=1
                allocated_files=$((allocated_files + 1))
                total_internal_frag=$((total_internal_frag + frag[$i]))
                break
            fi
        fi
    done

    if [[ $j -gt $nb ]]; then
        ff[$i]=-1
        frag[$i]=-1
    fi
done

# Print allocation details
echo -e "\nFile_no:\tFile_size:\tBlock_no:\tBlock_size:\tInternal_Fragment"
for ((i = 1; i <= nf; i++)); do
    if [[ ${ff[$i]} -ne -1 ]]; then
        echo -e "$i\t\t${f[$i]}\t\t${ff[$i]}\t\t${b[${ff[$i]}]}\t\t${frag[$i]}"
    else
        echo -e "$i\t\t${f[$i]}\t\tNot Allocated"
    fi
done

echo -e "\nTotal number of files allocated: $allocated_files"
echo -e "Total internal fragmentation: $total_internal_frag"

echo -e "\nUnused blocks:"
echo -e "Block_no:\tBlock_size:"
for ((i = 1; i <= nb; i++)); do
    if [[ ${bf[$i]} -ne 1 ]]; then
        echo -e "$i\t\t${b[$i]}"
    fi
done

