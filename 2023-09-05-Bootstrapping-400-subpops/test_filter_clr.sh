#!/bin/bash
#$ -pe smp 20
#$ -l h_vmem=2G
#$ -l h_rt=40:0:0
#$ -cwd
#$ -j y
#$ -m beas


module load anaconda3
conda activate python_for_ballermix
module load parallel
module load vcftools
module load samtools
module load bcftools


# VCF filtering for each of the 4 populations in set-1
echo "Performing VCF filtering..."

parallel -j 8 'vcftools --gzvcf input/2022-05-18-missingness_10_samples_240_haploid.vcf.gz \
--keep test-set-1/{} \
--recode --stdout \
| bcftools filter --include "N_MISSING <= 10" \
| bcftools +fixploidy -- --force-ploidy 1 \
| bcftools view --min-ac 1:minor \
| bcftools +fill-tags -- -t AF,AC,F_MISSING \
| bgzip -c > test-set-1/{}.vcf.gz' ::: pop1 pop2 pop3 pop4

echo "VCF filtering done."

# Running BallerMixPlus script for each population and each chromosome
echo "Running BallerMixPlus parsing script..."

for pop in "pop1" "pop2" "pop3" "pop4"; do
  pop_file="test-set-1/${pop}.vcf.gz"

  # Check if the population VCF file exists
  if [ ! -f $pop_file ]; then
    echo "File $pop_file does not exist, skipping..."
    continue
  fi

  parallel -j 6 "python BallerMixPlus/parsing_scripts/parse_ballermix_input.py --vcf test-set-1/${pop}.vcf.gz -c {} --rec_rate 1.25e-6 --hap -o test-set-1/2023-08-02-${pop}_{}.txt" :::: test_chr_numbers

  cat test-set-1/2023-08-02-${pop}* | awk '(NR == 1 || $1 != "position")' > test-set-1/2023-Concatenated_${pop}_input_for_helper_file.txt

  python BallerMixPlus/BalLeRMix+_v1.py -i test-set-1/2023-Concatenated_${pop}_input_for_helper_file.txt --getSpect --noSub --MAF --spect test-set-1/2023-${pop}SFS_MAF.txt

  parallel -j 19 "python BallerMixPlus/BalLeRMix+_v1.py --noSub --MAF --spect test-set-1/2023-${pop}SFS_MAF.txt -i test-set-1/2023-08-02-${pop}_{}.txt -o test-set-1/B0maf_${pop}_Chr{}.txt --findBal" :::: test_chr_numbers

done

# Concatenate for next step
#echo "Concatenating files..."
#cat tmp/2023-08-02-Pop3_*.txt | awk '(NR == 1 || $1 != "position")' > tmp/2023-08-02-Concatenated_Pop3_input_for_helper_file.txt

# Create helper file
#echo "Creating helper file..."
#python BallerMixPlus/BalLeRMix+_v1.py -i set-1/2023-Concatenated_${pop}_input_for_helper_file.txt --getSpect --noSub --MAF --spect set-1/2023-08-02-SFS_MAF.txt

# Run Ballermix
#echo "Running BallerMixPlus main script (~3 hours)..."
#parallel -j 16 'python BallerMixPlus/BalLeRMix+_v1.py --noSub --MAF --spect tmp/2023-08-02-SFS_MAF.txt -i tmp/2023-08-02-Pop3_{}.txt -o results/08-02-B0maf_Chr{}.txt --findBal' :::: chr_numbers

echo "All tasks complete."

