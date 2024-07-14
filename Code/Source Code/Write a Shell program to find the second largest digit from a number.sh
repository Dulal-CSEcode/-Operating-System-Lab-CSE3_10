#!/bin/bash

read -p "Enter a number: " number

largest_digit=0
second_largest=0

# Extract digits one by one and find the second largest
while [ $number -gt 0 ]; do
    digit=$((number % 10))
    if [ $digit -gt $largest_digit ]; then
        second_largest=$largest_digit
        largest_digit=$digit
    elif [ $digit -gt $second_largest ] && [ $digit -ne $largest_digit ]; then
        second_largest=$digit
    fi
    number=$((number / 10))
done

echo "The second largest digit in the number is: $second_largest"
