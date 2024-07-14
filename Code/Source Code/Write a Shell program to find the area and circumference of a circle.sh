echo "Enter the radius of the circle:"
read radius

area=$(echo "scale=2; 3.14159 * $radius * $radius" | bc)
circumference=$(echo "scale=2; 2 * 3.14159 * $radius" | bc)


echo "The area of the circle with radius $radius is: $area"
echo "The circumference of the circle with radius $radius is: $circumference"
