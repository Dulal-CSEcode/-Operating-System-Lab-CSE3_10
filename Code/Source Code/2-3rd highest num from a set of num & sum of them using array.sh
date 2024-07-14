echo "Enter the number of elements: "
read n
declare -a numbers
for (( i=0; i<n; i++ )); do
  echo "Enter the number: "
  read numbers[$i]
done
sorted_numbers=($(echo "${numbers[@]}" | tr ' ' '\n' | sort -nr | tr '\n' ' '))
second_highest=${sorted_numbers[1]}
third_highest=${sorted_numbers[2]}
sum=$((second_highest + third_highest))
echo "The sum of the 2nd and 3rd highest elements is: ($second_highest+$third_highest) = $sum"
