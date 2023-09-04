#!/bin/bash

# Input file containing sample names, one per line
input_file="sample_names.txt"

# Create a directory to store the sets
mkdir -p sets

# Define the number of sets and the size of each set
num_sets=100
set_size=34

# Read the sample names into an array
mapfile -t sample_names < "$input_file"

# Shuffle the sample names randomly
shuffled_names=($(shuf -e "${sample_names[@]}"))

# Loop to create 100 sets
for i in $(seq 1 "$num_sets"); do
    # Calculate the start and end indices for each set
    start=$((($i - 1) * $set_size))
    end=$(($i * $set_size - 1))
    
    # Create a new set file for this iteration
    set_file="sets/set_$i.txt"
    
    # Extract and save the sample names for this set
    for j in $(seq "$start" "$end"); do
        echo "${shuffled_names[j]}" >> "$set_file"
    done
done

