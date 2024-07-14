
sum_even=0
sum_odd=0

is_even() {
    if [ $(($1 % 2)) -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

echo "Enter numbers (separated by spaces):"
read -a numbers


for num in "${numbers[@]}"; do
    if is_even $num; then
        sum_even=$((sum_even + num))
    else
        sum_odd=$((sum_odd + num))
    fi
done


echo "Sum of even numbers: $sum_even"
echo "Sum of odd numbers: $sum_odd"

