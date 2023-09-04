#!/usr/bin/Rscript

# Load required libraries
libraries <- c("tidyverse", "data.table")
for (lib in libraries) {
  if (!requireNamespace(lib, quietly = TRUE)) {
    suppressPackageStartupMessages(library(lib, character.only = TRUE))
  }
}

# List of input files (replace with actual filenames)
input_files <- paste0("tmp_ncd/set_", 1:100, ".txt.vcf.gz_inputNCD.txt")

# Loop through each input file
for (input_file in input_files) {
  # Load input
  all_chrs <- read.table(input_file, 
                         col.names = c("CHR", "POS", "ID", "REF", "ALT", "AF2"))
  
  all_chrs$AF1 <- (1 - all_chrs$AF2)
  all_chrs$MAF <- pmin(all_chrs$AF1, all_chrs$AF2)
  
  # Load data.table package here
  library(data.table)
  
  all_chrs_ncd_format <- data.table(CHR = all_chrs$CHR, POS = all_chrs$POS,
                                    ID = all_chrs$ID, REF = all_chrs$REF, 
                                    ALT = all_chrs$ALT, AF1 = all_chrs$AF1,
                                    AF2 = all_chrs$AF2, MAF = all_chrs$MAF)
  
  # Loop through each chromosome
  vect_chr <- unique(all_chrs$CHR)
  
  ncd_input_list <- list()
  
  for (chr in vect_chr) {
    chr_ncd_format <- all_chrs_ncd_format[all_chrs_ncd_format$CHR == chr,]
    ncd_input_list[[chr]] <- chr_ncd_format
  }
  
  output_file <- gsub("_inputNCD.txt", "_NCD_input.rds", input_file)
  
  saveRDS(ncd_input_list, file = output_file)
}
