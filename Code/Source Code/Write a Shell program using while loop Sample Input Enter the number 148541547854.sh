#!/bin/bash

read -p "Enter the number: " input_number

declare -A digit_count
number_length=${#input_number}
index=0

while [ $index -lt $number_length ]; do

  digit=${input_number:$index:1}
  ((digit_count[$digit]++))
  ((index++))
done

for digit in "${!digit_count[@]}"; do
  echo "$digit = ${digit_count[$digit]} times"
done
