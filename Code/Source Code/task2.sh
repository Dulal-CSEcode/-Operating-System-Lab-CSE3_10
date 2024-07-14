
is_valid_triangle() {
    local a=$1
    local b=$2
    local c=$3

    if [ $(($a + $b)) -gt $c ] && [ $(($b + $c)) -gt $a ] && [ $(($c + $a)) -gt $b ]; then
        echo "Triangle is valid."
    else
        echo "Triangle is not valid."
    fi
}


echo "Enter the lengths of the triangle sides:"
read -p "Side 1: " side1
read -p "Side 2: " side2
read -p "Side 3: " side3


is_valid_triangle $side1 $side2 $side3

