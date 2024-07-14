#!/bin/bash

echo "Enter the number of frames: "
read fm
echo "Enter the number of pages: "
read pg

echo "Enter pages: "
for ((i=0; i<pg; i++)); do
    read n
    pages[$i]=$n
done

for ((i=0; i<$fm; i++)); do
    memory[$i]=-1
    time[$i]=0
done

Count=0
echo "The LRU Page Replacement Process is--------"

for ((i=0; i<$pg; i++)); do
    flag1=0
    flag2=0

    for ((j=0; j<$fm; j++)); do
        if [ ${memory[$j]} -eq ${pages[$i]} ]; then
            flag1=1
            flag2=1
            time[$j]=$i
            break
        fi
    done

    if [ $flag1 -eq 0 ]; then
        for ((j=0; j<$fm; j++)); do
            if [ ${memory[$j]} -eq -1 ]; then
                memory[$j]=${pages[$i]}
                time[$j]=$i
                Count=$((Count + 1))
                flag2=1
                break
            fi
        done
    fi

    if [ $flag2 -eq 0 ]; then
        minimum=${time[0]}
        pos=0

        for ((j=1; j<$fm; j++)); do
            if [ ${time[$j]} -lt $minimum ]; then
                minimum=${time[$j]}
                pos=$j
            fi
        done

        memory[$pos]=${pages[$i]}
        time[$pos]=$i
        Count=$((Count + 1))
    fi

    echo "For $i: "

    for ((k=0; k<$fm; k++)); do
        if [ ${memory[$k]} -ne -1 ]; then
            echo "  ${memory[$k]}"
        else
            echo "  -"
        fi
    done

    if [ $flag1 -eq 0 ]; then
        echo "Page Fault No : $Count"
    fi

    echo
done

echo "The number of page faults is: $Count"
hit=$((pg - Count))
echo "The number of hit is: $hit"
