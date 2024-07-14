read -p "Enter the array length : " size

declare -a arr

for ((i=0; i<size; i++)); do
    read -p "Enter number $((i+1)): " arr[i]
done

largest=${arr[0]}

for ((i=1; i<size; i++)); do
    if [ ${arr[i]} -gt $largest ]; then
        largest=${arr[i]}
    fi
done

echo "The largest element in  array is: $largest"
