read -p "Enter the string: " input_string
count_alpha=0
count_digit=0
count_special=0
for (( i=0; i<${#input_string}; i++ )); do
  char=${input_string:$i:1}
  if [[ $char =~ [A-Za-z] ]]; then
    ((count_alpha++))
  elif [[ $char =~ [0-9] ]]; then
    ((count_digit++))
  else
    ((count_special++))
  fi
done
echo "Alphabets = $count_alpha"
echo "Digits = $count_digit"
echo "Special characters = $count_special"
