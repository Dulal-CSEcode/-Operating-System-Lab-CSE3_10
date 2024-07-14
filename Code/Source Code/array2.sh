read -p "Enter the array length: " count

numbers=()

for ((i=1; i<=count; i++)); do
    read -p "Enter number $i: " num
    numbers+=("$num")
done

sum=0
for num in "${numbers[@]}"; do
    sum=$((sum + num))
done

average=$(echo "scale=2; $sum / $count" | bc)

echo "The average of array elements : $average"
