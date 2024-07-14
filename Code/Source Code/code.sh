#!/bin/bash

print_frames() {
  local frameno=$1
  shift
  local frames=("$@")
  for ((j=0; j<$frameno; j++)); do
    if [ "${frames[j]}" -ne -1 ]; then
      echo -n "${frames[j]} "
    fi
  done
  echo
}

# Read input
echo "Enter the number of pages"
read n
echo "Enter the page reference numbers"
read -a pages
echo "Enter the number of frames"
read frameno

# Initialize frames and count1 arrays
frames=()
count1=()
for ((i=0; i<$frameno; i++)); do
  frames[i]=-1
  count1[i]=0
done

echo "The Page Replacement Process is –>"

move=0
count=0
page_faults=0

for ((i=0; i<$n; i++)); do
  page=${pages[i]}
  echo -n "For $page : "
  flag=0

  # Check if the page is already in one of the frames
  for ((j=0; j<$frameno; j++)); do
    if [ "${frames[j]}" -eq "$page" ]; then
      flag=1
      count1[j]=$((count1[j] + 1))
      echo "No page fault!"
      break
    fi
  done

  # If page is not in one of the frames and there's space in the frame
  if [ $flag -eq 0 ] && [ $count -lt $frameno ]; then
    frames[move]=$page
    count1[move]=1
    move=$(( (move + 1) % frameno ))
    count=$((count + 1))
    page_faults=$((page_faults + 1))
    print_frames $frameno "${frames[@]}"
  elif [ $flag -eq 0 ]; then
    # If page is not in one of the frames and there's no space in the frame
    repindex=0
    leastcount=${count1[0]}
    for ((j=1; j<$frameno; j++)); do
      if [ ${count1[j]} -lt $leastcount ]; then
        repindex=$j
        leastcount=${count1[j]}
      fi
    done
    frames[repindex]=$page
    count1[repindex]=1
    page_faults=$((page_faults + 1))
    print_frames $frameno "${frames[@]}"
  fi
done

echo "Total no of page faults using LFU is: $page_faults"

