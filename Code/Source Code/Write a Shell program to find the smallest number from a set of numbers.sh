#!/bin/bash

read -p "Enter numbers separated by spaces: " numbers
echo "$numbers" | tr ' ' '\n' | sort -n | head -1
