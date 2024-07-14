echo "Enter the length of the rectangle:"
read length
echo "Enter the width of the rectangle:"
read width


area=$(echo "$length * $width" | bc)
perimeter=$(echo "2 * ($length + $width)" | bc)

echo "The area of the rectangle with length $length and width $width is: $area"
echo "The perimeter of the rectangle with length $length and width $width is: $perimeter"
