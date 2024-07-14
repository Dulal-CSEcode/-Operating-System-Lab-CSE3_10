#!/bin/bash

sum=0

for ((i=51; i<=100; i+=3)); do
    if [ $((i % 5)) -ne 0 ]; then
        sum=$((sum + i))
    fi
done

echo "Sum of numbers between 50 and 100, divisible by 3 and not divisible by 5: $sum"
