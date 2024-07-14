sum_even=0
sum_odd=0

echo "Enter numbers (separated by spaces):"
read -r input

read -ra numbers <<< "$input"

is_even() {
    if (( $1 % 2 == 0 )); then
        return 0
    else
        return 1
    fi
}

for num in "${numbers[@]}"; do
    if is_even "$num"; then
        sum_even=$((sum_even + num))
    else
        sum_odd=$((sum_odd + num))
    fi
done

echo "Sum of even numbers: $sum_even"
echo "Sum of odd numbers: $sum_odd"
