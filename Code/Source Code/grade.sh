get_grade() {
    local marks=$1
    grade=""

    case $marks in
        90*|91|92|93|94|95|96|97|98|99|100)
            grade="A+";;
        80*|81|82|83|84|85|86|87|88|89)
            grade="A";;
        70*|71|72|73|74|75|76|77|78|79)
            grade="B+";;
        60*|61|62|63|64|65|66|67|68|69)
            grade="B";;
        50*|51|52|53|54|55|56|57|58|59)
            grade="C+";;
        40*|41|42|43|44|45|46|47|48|49)
            grade="C";;
        30*|31|32|33|34|35|36|37|38|39)
            grade="D";;
        *)
            grade="F";;
    esac

    echo "$grade"
}

echo "Enter student marks:"
read marks


grade=$(get_grade $marks)

echo "The grade for marks $marks is: $grade"
