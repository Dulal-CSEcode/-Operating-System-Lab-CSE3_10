#!/bin/bash

read -p "Enter the number of terms in Fibonacci series: " n

# Initialize first two terms
a=0
b=1

echo "Fibonacci series up to $n terms:"
echo -n "$a "

for ((i=1; i<n; i++)); do
    echo -n "$b "
    c=$((a + b))
    a=$b
    b=$c
done

echo
