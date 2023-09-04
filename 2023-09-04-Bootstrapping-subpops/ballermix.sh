#!/bin/bash

# Clone the repository (if needed)
# git clone https://github.com/bioXiaoheng/BallerMixPlus.git

# Load required modules
module load anaconda3
conda activate python_for_ballermix
module load parallel

# Loop through each set
for set_number in {1..100}; do
    input_vcf="set_${set_number}.txt.vcf.gz"

    # Parse each set
    parallel -j 10 "python BallerMixPlus/parsing_scripts/parse_ballermix_input.py --vcf vcf/$input_vcf -c {} --rec_rate 1.25e-6 --hap -o tmp/${input_vcf/.vcf.gz}_{}.txt" :::: chr_numbers

    # Concatenate for the next step
    cat tmp/${input_vcf/.vcf.gz}_*.txt | awk '(NR == 1 || $1 != "position")' > tmp/${input_vcf/.vcf.gz}_Concatenated_input_for_helper_file.txt

    # Create the helper file
    python BallerMixPlus/BalLeRMix+_v1.py -i tmp/${input_vcf/.vcf.gz}_Concatenated_input_for_helper_file.txt --getSpect --noSub --MAF --spect tmp/${input_vcf/.vcf.gz}_SFS_MAF.txt

    # Run Ballermix (~3 hours)
    parallel -j 16 'python BallerMixPlus/BalLeRMix+_v1.py --noSub --MAF --spect tmp/${input_vcf/.vcf.gz}_SFS_MAF.txt -i tmp/${input_vcf/.vcf.gz}_{}.txt -o results/${input_vcf/.vcf.gz}_B0maf_Chr{}.txt --findBal' :::: chr_numbers
done

