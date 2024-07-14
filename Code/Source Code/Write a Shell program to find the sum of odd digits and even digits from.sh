#!/bin/bash

read -p "Enter a number: " number

odd_sum=0
even_sum=0

# Function to check if a number is odd
is_odd() {
    if [ $(( $1 % 2 )) -eq 1 ]; then
        return 0
    else
        return 1
    fi
}

# Function to check if a number is even
is_even() {
    if [ $(( $1 % 2 )) -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

# Loop to iterate through each digit of the number
while [ $number -gt 0 ]; do
    digit=$((number % 10))
    if is_odd $digit; then
        odd_sum=$((odd_sum + digit))
    elif is_even $digit; then
        even_sum=$((even_sum + digit))
    fi
    number=$((number / 10))
done

echo "Sum of odd digits: $odd_sum"
echo "Sum of even digits: $even_sum"
