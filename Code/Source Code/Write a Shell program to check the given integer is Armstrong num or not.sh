#!/bin/bash

read -p "Enter a number: " number

power() {
    echo "$1^$2" | bc
}

count_digits() {
    echo -n "$1" | wc -c
}

is_armstrong() {
    local num=$1
    local power=$2
    local sum=0
    local temp=$num

    while [ $temp -gt 0 ]; do
        digit=$((temp % 10))
        sum=$((sum + $(power $digit $power)))
        temp=$((temp / 10))
    done

    if [ $sum -eq $num ]; then
        echo "$num is an Armstrong number."
    else
        echo "$num is not an Armstrong number."
    fi
}

num_digits=$(count_digits $number)
is_armstrong $number $num_digits
