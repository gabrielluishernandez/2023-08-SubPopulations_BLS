#!/bin/bash

# Loop over directories that match the pattern "output_*-ballemix_qsub"
for dir in output_*-ballemix_qsub; do
  # Check if it is a directory
  if [ -d "$dir" ]; then
    echo "Processing directory: $dir"
    
    # Loop over subdirectories inside each matching directory
    for subdir in $dir/*; do
      if [ -d "$subdir" ]; then
        # Extract the name of the subdirectory
        subdir_name=$(basename "$subdir")
        
        # Copy subdirectory to the current working directory
        # If you want to overwrite existing directories, you can add the '-f' flag to 'cp'
        cp -r "$subdir" "./$subdir_name"
      fi
    done
  fi
done

