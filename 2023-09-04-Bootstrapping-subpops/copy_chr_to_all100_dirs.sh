#!/bin/bash

# Replace "source_file.txt" with the name of the file you want to copy
source_file="BallerMixPlus"

# Loop through each destination directory and copy the file
for ((i = 1; i <= 100; i++)); do
    dest_dir="output_dirs/set_${i}_output/"
    cp -r "$source_file" "$dest_dir"
done


