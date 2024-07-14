#!/bin/bash

read -p "Enter numbers separated by spaces: " numbers

highest=0
second_highest=0

for num in $numbers; do
    if [ $num -gt $highest ]; then
        second_highest=$highest
        highest=$num
    elif [ $num -gt $second_highest ] && [ $num -ne $highest ]; then
        second_highest=$num
    fi
done

echo "Second highest number: $second_highest"
