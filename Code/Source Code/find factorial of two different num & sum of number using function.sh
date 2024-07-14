factorial() {
  local num=$1
  local fact=1
  for (( i=2; i<=num; i++ )); do
    fact=$((fact * i))
  done
  echo $fact
}
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2
fact1=$(factorial $num1)
fact2=$(factorial $num2)
sum=$((fact1 + fact2))
echo "Factorial of $num1 is $fact1"
echo "Factorial of $num2 is $fact2"
echo "$fact1 + $fact2 = $sum"
