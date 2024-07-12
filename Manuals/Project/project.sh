#!/bin/bash






# Step 1: Set up global variables and trap Ctrl+C
menu_choice=""
record_file="bookRecords.ldb"
temp_file="/tmp/ldb.$$"
trap 'rm -f $temp_file' EXIT





# Step 2: Define utility functions
get_return(){
    printf '\nPress (Enter)  to return main menu !'
    read x
    return 0
}

get_confirm(){
    printf 'Are you sure (y|yes|Y|Yes|YES) or (n|no|N|No|NO) : '
    while true; do 
        read x
        case "$x" in
            y|yes|Y|Yes|YES)
                return 0;;
            n|no|N|No|NO)
                printf '\ncancelled\n'
                return 1;;
            *) printf '\nPlease enter yes or no : ';;
        esac
    done
}






# Step 3: Define main menu function
set_menu_choice(){
    clear
    printf "****************************************************\n\n"
    printf "########## Library Management System ##########\n"
    printf "########## Design By Dulal-213902116 ##########\n\n"
    printf "****************************************************\n\n\n"
    printf '		Options:-\n\n'
    printf '	\ta) Add new Books records\n'
    printf '	\tb) Find Books\n'
    printf '	\tc) Edit Books\n'
    printf '	\td) Remove Books\n'
    printf '	\te) View Books\n'
    printf '	\tf) Quit\n'
    printf 'Please enter the choice then press return : '
    read menu_choice
    return
}






# Step 4: Define function to insert records
insert_record(){
    echo "$*" >> "$record_file"
    return
}

add_books(){
    printf 'Enter Books category:-'
    read liCatNum

    printf 'Enter Books title:-'
    read liTitleNum

    printf 'Enter Author Name:-'
    read liAutherNum

    printf '\nAre you want to save this record or not \n'
    
    printf "\nBooks category : $liCatNum\n"
    printf "Books title : $liTitleNum\n"
    printf "Author Name : $liAutherNum\n"
    #printf "$liCatNum\t$liTitleNum\t$liAutherNum\n"
    
    

    if get_confirm; then
       insert_record "$liCatNum			$liTitleNum	 	   $liAutherNum"
    fi

    return
}






# Step 5: Define function to find books
find_books(){
    grep -i "$1" "$record_file" > "$temp_file"
    linesfound=$(wc -l < "$temp_file")

    case "$linesfound" in
        0)  echo "Sorry, nothing found"
            get_return
            ;;
        *)  echo "Found the following"
            cat "$temp_file"
            get_return
            ;;
    esac

    return
}






# Step 6: Define function to remove books
remove_books(){
    grep -v "$1" "$record_file" > "$temp_file"

    if [ $? -eq 0 ]; then
        mv "$temp_file" "$record_file"
        printf "\nBook has been removed ."
    else
        printf "\nError removing book !"
    fi

    get_return
    return
}





# Step 7: Define function to view books
view_books(){
    printf "\nList of books are :\n"
    
    printf "\nBooks category 	      Books title 	   Author Name \n\n"
    cat "$record_file"
    get_return
    return
}





# Step 8: Define function to edit books
edit_books(){
    printf "\nList of books are\n"
    cat "$record_file"
    printf "\nType the title of book you want to edit : "
    read searchstr

    if [ -z "$searchstr" ]; then
        return 0
    fi

    grep -v "$searchstr" "$record_file" > "$temp_file"
    mv "$temp_file" "$record_file"

    printf "\nEnter the new record \n"
    add_books
}





# Initialize record file if not exists
if [ ! -f "$record_file" ]; then
    touch "$record_file"
fi

clear
printf '\n\n\n'
printf 'Library Management System Design By Dulal-213902116: '
sleep 1

quit="n"
while [ "$quit" != "y" ]; do
    set_menu_choice
    case "$menu_choice" in
        
        A|a) add_books;;
        B|b) printf "Enter (letter or string) to find the book from book_list : "; read term; find_books "$term";;
        C|c) edit_books;;
        D|d) printf "Enter book title to remove: "; read title; remove_books "$title";;
        E|e) view_books;;
        F|f) quit=y;;
        *) printf "Sorry, choice not recognized";;
    esac
done





# Tidy up and leave
rm -f "$temp_file"
echo "Finished"
exit 0
