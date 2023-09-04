#!/bin/bash

module load parallel
module load bcftools

parallel -j0 "bcftools query -f '%CHROM\t%POS\t%CHROM|%POS\t%REF\t%ALT\t%AF\n' vcf/{} > tmp_ncd/{}_inputNCD.txt" :::: list_vcf_dir

