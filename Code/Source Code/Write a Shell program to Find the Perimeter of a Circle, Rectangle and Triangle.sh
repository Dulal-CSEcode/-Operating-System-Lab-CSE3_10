
calculate_circle_perimeter() {
    local radius=$1
    local perimeter=$(echo "2 * 3.14159 * $radius" | bc)
    echo "Perimeter of the circle with radius $radius is: $perimeter"
}

calculate_rectangle_perimeter() {
    local length=$1
    local width=$2
    local perimeter=$(echo "2 * ($length + $width)" | bc)
    echo "Perimeter of the rectangle with length $length and width $width is: $perimeter"
}

calculate_triangle_perimeter() {
    local side1=$1
    local side2=$2
    local side3=$3
    local perimeter=$(echo "$side1 + $side2 + $side3" | bc)
    echo "Perimeter of the triangle with sides $side1, $side2, and $side3 is: $perimeter"
}

echo "Choose a shape to calculate perimeter:"
echo "1. Circle"
echo "2. Rectangle"
echo "3. Triangle"
read choice

case $choice in
    1)
        echo "Enter the radius of the circle:"
        read radius
        calculate_circle_perimeter $radius
        ;;
    2)
        echo "Enter the length of the rectangle:"
        read length
        echo "Enter the width of the rectangle:"
        read width
        calculate_rectangle_perimeter $length $width
        ;;
    3)
        echo "Enter the lengths of the sides of the triangle:"
        read side1
        read side2
        read side3
        calculate_triangle_perimeter $side1 $side2 $side3
        ;;
    *)
        echo "Invalid choice. Please select 1, 2, or 3."
        ;;
esac
