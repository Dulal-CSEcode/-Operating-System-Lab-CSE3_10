#!/bin/bash

read -p "Enter a number: " number

sum=0

# Extract digits one by one and calculate sum
while [ $number -gt 0 ]; do
    digit=$((number % 10))
    sum=$((sum + digit))
    number=$((number / 10))
done

echo "The sum of digits of the number is: $sum"
