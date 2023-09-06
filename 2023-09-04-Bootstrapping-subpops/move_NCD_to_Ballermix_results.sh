#!/bin/bash

# Loop over numbers from 1 to 100
for i in {1..100}; do
  # Define source and destination directories
  src_file="results/${i}_NCD1_win5Kb_step2500b.txt"
  dest_dir="set_${i}_output/results_set_${i}/"

  # Check if source file exists
  if [[ -f "$src_file" ]]; then
    # Copy the file
    cp "$src_file" "$dest_dir"
    echo "Copied ${src_file} to ${dest_dir}"
  else
    echo "Source file ${src_file} does not exist. Skipping."
  fi
done

