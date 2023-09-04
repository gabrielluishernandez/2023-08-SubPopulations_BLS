#!/bin/bash

module load parallel
module load vcftools
module load samtools
module load bcftools


parallel -j0 'vcftools --gzvcf input/2022-05-18-missingness_10_samples_240_haploid.vcf.gz \
--keep sets/{} \
--recode --stdout \
| bcftools filter --include "N_MISSING <= 10" \
| bcftools +fixploidy -- --force-ploidy 1 \
| bcftools view --min-ac 1:minor \
| bcftools +fill-tags -- -t AF,AC,F_MISSING \
| bgzip -c > vcf/{}.vcf.gz' :::: input_sets.txt
