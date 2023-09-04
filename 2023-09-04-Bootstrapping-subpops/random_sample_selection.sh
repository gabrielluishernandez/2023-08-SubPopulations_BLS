#!/bin/bash

# Input file containing sample names, one per line
input_file="input/All_4pops_samples.txt"

# Create a directory to store the sets
mkdir sets

# Define the number of sets and the size of each set
num_sets=100
set_size=34

# Read the sample names into an array
mapfile -t sample_names < "$input_file"

# Loop to create 100 sets
for i in $(seq 1 "$num_sets"); do
    # Create a new set file for this iteration
    set_file="sets/set_$i.txt"
    
    # Randomly sample with replacement
    for j in $(seq 1 "$set_size"); do
        # Generate a random index within the range of sample_names array
        rand_index=$((RANDOM % ${#sample_names[@]}))
        echo "${sample_names[rand_index]}" >> "$set_file"
    done
done

