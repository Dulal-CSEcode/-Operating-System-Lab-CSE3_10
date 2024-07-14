
is_palindrome() {
    local input=$1
    local reversed=$(echo "$input" | rev)
    [ "$input" == "$reversed" ] && echo "Palindrome" || echo "Not a palindrome"
}

echo "Enter the string:"
read string

echo "String is: $(is_palindrome "$string")"
