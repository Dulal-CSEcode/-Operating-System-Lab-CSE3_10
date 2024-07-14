#!/bin/bash

read -p "Enter 7-digit number: " number
if [[ ! $number =~ ^[0-9]{7}$ ]]; then
  echo "Please enter a valid 7-digit number."
  exit 1
fi
for (( i=0; i<${#number}; i++ )); do
  digit=${number:$i:1}
  # Check if the position is odd 
  if (( $((i % 2)) == 0 )); then
    echo $digit
  fi
done
