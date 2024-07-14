#!/bin/bash

read -p "Enter a number: " number

smallest_digit=9

# Extract digits one by one and find the smallest
while [ $number -gt 0 ]; do
    digit=$((number % 10))
    if [ $digit -lt $smallest_digit ]; then
        smallest_digit=$digit
    fi
    number=$((number / 10))
done

echo "The smallest digit in the number is: $smallest_digit"
