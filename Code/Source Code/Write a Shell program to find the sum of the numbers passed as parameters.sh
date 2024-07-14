calculate_sum() {
    sum=0
    for num in "$@"; do
        sum=$((sum + num))
    done
    echo $sum
}

calculate_sum 1 2

echo "The sum of the numbers passed as parameters is: $sum"
