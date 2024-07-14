read -p "Enter first number: " num1
read -p "Enter second number: " num2

sum=0

sum() {
    echo "parameters: $1 $2"
    sum=$(( $1 + $2 ))
    echo "Sum of parameters: $sum"
}

sum $num1 $num2
