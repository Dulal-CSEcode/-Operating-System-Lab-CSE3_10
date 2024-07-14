#!/bin/bash
sum_odd=0
sum_even=0
for num in "$@"
do
  if [ $((num % 2)) -eq 0 ]; then
    sum_even=$((sum_even + num))
  else
    sum_odd=$((sum_odd + num))
  fi
done

echo "Sum of even numbers: $sum_even"
echo "Sum of odd numbers: $sum_odd"
