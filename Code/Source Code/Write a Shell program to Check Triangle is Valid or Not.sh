#!/bin/bash

is_valid_triangle() {

  if [ $(($1 + $2)) -gt $3 ] && [ $(($2 + $3)) -gt $1 ] && [ $(($1 + $3)) -gt $2 ]; then
    echo "The sides $1, $2, and $3 form a valid triangle."
  else
    echo "The sides $1, $2, and $3 do not form a valid triangle."
  fi
}

if [ $# -ne 3 ]; then
  echo "Please provide exactly three numbers as sides of a triangle."
  exit 1
fi
is_valid_triangle $1 $2 $3
