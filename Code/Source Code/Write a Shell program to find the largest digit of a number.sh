#!/bin/bash

read -p "Enter a number: " number

largest_digit=0

# Loop to iterate through each digit of the number
while [ $number -gt 0 ]; do
    digit=$((number % 10))
    if [ $digit -gt $largest_digit ]; then
        largest_digit=$digit
    fi
    number=$((number / 10))
done

echo "The largest digit in the number is: $largest_digit"
