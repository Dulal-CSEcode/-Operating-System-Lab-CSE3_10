#!/bin/bash

arr=(prakhar ankit mim rishabh manish abhinav)

for item in "${arr[@]}"; do
    if [[ ! "$item" =~ [aA] ]]; then
        echo "$item"
    fi
done

