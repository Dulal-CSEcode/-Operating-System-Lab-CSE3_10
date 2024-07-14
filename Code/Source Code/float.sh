read -p "Enter degree celsius temperature: " c

f=`echo "scale=4; $c*1.8 + 32" | bc`
echo "$c degree celsius is equal to $f degree fahrenheit"

