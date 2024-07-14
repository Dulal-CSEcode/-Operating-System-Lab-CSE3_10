
get_grade() {
    local marks=$1
    grade=""

    if (( marks >= 80 )); then
        grade="A+"
    elif (( marks >= 75 )); then
        grade="A"
    elif (( marks >= 70 )); then
        grade="A-"
    elif (( marks >= 65 )); then
        grade="B+"
    elif (( marks >= 60 )); then
        grade="B"
    elif (( marks >= 55 )); then
        grade="C+"
    elif (( marks >= 50 )); then
        grade="C"
	elif (( marks >= 45 )); then
        grade="D+"
	elif (( marks >= 40 )); then
        grade="D"
		
    else
        grade="F"
    fi

    echo "$grade"
}


echo "Enter student marks:"
read marks


grade=$(get_grade $marks)


echo "The grade for marks $marks is: $grade"
