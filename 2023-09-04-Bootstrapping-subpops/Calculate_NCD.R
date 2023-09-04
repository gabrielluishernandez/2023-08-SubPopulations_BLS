source('NCD-statistics/scripts/preamble.R')
source('NCD-statistics/scripts/NCD_func.R')

# List of input files (replace with actual filenames)
input_files <- paste0("tmp_ncd/set_", 1:100, ".txt.vcf.gz_NCD_input.rds")


# Loop through each input file
for (input_file in input_files) {
  # Load SNP_input from RDS file
  SNP_input <- readRDS(input_file)
  
  # Process each element in SNP_input using parallel processing
  sep.run.ncd1 <- foreach(x = 1:15, .combine = "rbind", .packages = "data.table") %dopar% {
    NCD1(X = SNP_input[[x]], W = 5000, S = 2500)
  }
  
  # Generate the output filename based on the input file
  output_filename <- gsub("tmp_ncd/set_", "results/", input_file)
  output_filename <- gsub(".txt.vcf.gz_NCD_input.rds", "_NCD1_win5Kb_step2500b.txt", output_filename)
  
  # Write the result to the output file
  write.table(sep.run.ncd1, file = output_filename, quote = FALSE, row.names = FALSE, sep = "\t")
}