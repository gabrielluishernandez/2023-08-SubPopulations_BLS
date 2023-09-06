#!/bin/bash

module load bedtools
module load parallel

mkdir set_70_output/results_set_70/tmp
mkdir set_70_output/results_set_70/results

# Create individual NCD files
#parallel -j 15  "sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep {} > set_70_output/results_set_70/tmp/{}-NCD.txt " :::: chr_numbers

sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031901.1" > set_70_output/results_set_70/tmp/chr1-NCD.txt
sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031902.1" > set_70_output/results_set_70/tmp/chr2-NCD.txt
sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031903.1" > set_70_output/results_set_70/tmp/chr3-NCD.txt
sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031904.1" > set_70_output/results_set_70/tmp/chr4-NCD.txt
sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031905.1" > set_70_output/results_set_70/tmp/chr5-NCD.txt
sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031906.1" > set_70_output/results_set_70/tmp/chr6-NCD.txt
sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031907.1" > set_70_output/results_set_70/tmp/chr7-NCD.txt
sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031908.1" > set_70_output/results_set_70/tmp/chr8-NCD.txt
sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031909.1" > set_70_output/results_set_70/tmp/chr9-NCD.txt
sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031910.1" > set_70_output/results_set_70/tmp/chr10-NCD.txt
sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031911.1" > set_70_output/results_set_70/tmp/chr11-NCD.txt
sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031912.1" > set_70_output/results_set_70/tmp/chr12-NCD.txt
sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031913.1" > set_70_output/results_set_70/tmp/chr13-NCD.txt
sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031914.1" > set_70_output/results_set_70/tmp/chr14-NCD.txt
sed 's/|/\t/g' set_70_output/results_set_70/70_NCD1_win5Kb_step2500b.txt | grep "CM031915.1" > set_70_output/results_set_70/tmp/chr15-NCD.txt


# Modify Ballermix files
awk '{print "CM031901.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031901.1.txt > set_70_output/results_set_70/tmp/chr1-B0maf.txt
awk '{print "CM031902.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031902.1.txt > set_70_output/results_set_70/tmp/chr2-B0maf.txt
awk '{print "CM031903.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031903.1.txt > set_70_output/results_set_70/tmp/chr3-B0maf.txt
awk '{print "CM031904.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031904.1.txt > set_70_output/results_set_70/tmp/chr4-B0maf.txt
awk '{print "CM031905.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031905.1.txt > set_70_output/results_set_70/tmp/chr5-B0maf.txt
awk '{print "CM031906.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031906.1.txt > set_70_output/results_set_70/tmp/chr6-B0maf.txt
awk '{print "CM031907.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031907.1.txt > set_70_output/results_set_70/tmp/chr7-B0maf.txt
awk '{print "CM031908.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031908.1.txt > set_70_output/results_set_70/tmp/chr8-B0maf.txt
awk '{print "CM031909.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031909.1.txt > set_70_output/results_set_70/tmp/chr9-B0maf.txt
awk '{print "CM0319010.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031910.1.txt > set_70_output/results_set_70/tmp/chr10-B0maf.txt
awk '{print "CM0319011.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031911.1.txt > set_70_output/results_set_70/tmp/chr11-B0maf.txt
awk '{print "CM0319012.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031912.1.txt > set_70_output/results_set_70/tmp/chr12-B0maf.txt
awk '{print "CM0319013.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031913.1.txt > set_70_output/results_set_70/tmp/chr13-B0maf.txt
awk '{print "CM0319014.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031914.1.txt > set_70_output/results_set_70/tmp/chr14-B0maf.txt
awk '{print "CM0319015.1",$1,$1+1,$3}' set_70_output/results_set_70/B0maf_ChrCM031915.1.txt > set_70_output/results_set_70/tmp/chr15-B0maf.txt

# Remove the first line (header)
parallel "sed -i '1d' set_70_output/results_set_70/tmp/{}-B0maf.txt" :::: short_chr_names

# Fix tabs
parallel -j 15 "sed 's/\s/\t/g' set_70_output/results_set_70/tmp/{}-B0maf.txt > set_70_output/results_set_70/tmp/{}-B0maf.bed" :::: short_chr_names

# Combine NCD and Ballermix
parallel -j 15 'bedtools intersect -wo -a set_70_output/results_set_70/tmp/{}-NCD.txt -b set_70_output/results_set_70/tmp/{}-B0maf.bed > set_70_output/results_set_70/results/Combined_{}.txt' :::: short_chr_names

# Re-organise
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr1.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr1_ordered.txt
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr2.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr2_ordered.txt
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr3.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr3_ordered.txt
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr4.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr4_ordered.txt
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr5.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr5_ordered.txt
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr6.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr6_ordered.txt
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr7.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr7_ordered.txt
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr8.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr8_ordered.txt
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr9.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr9_ordered.txt
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr10.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr10_ordered.txt
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr11.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr11_ordered.txt
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr12.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr12_ordered.txt
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr13.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr13_ordered.txt
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr14.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr14_ordered.txt
awk '{print $9,$10,$11,$12,$2,$3,$6,$7,$8}' set_70_output/results_set_70/results/Combined_chr15.txt | sed 's/\s/\t/g' > set_70_output/results_set_70/results/Combined_chr15_ordered.txt

# Get gff and subset per chromosome
#cp /data/home/btx422/hive/flopezosorio/2021_popgen_invicta_richteri/results/01_map_annotations/2021-10-28-liftoff_ncbi_annotations/qmul_sinvicta_genomic.liftoff.tidy.longest_isoform.gff input/.

parallel -j 15 'bedtools intersect -wo -a input/qmul_sinvicta_genomic.liftoff.tidy.longest_isoform.gff -b set_70_output/results_set_70/results/Combined_{}_ordered.txt > set_70_output/results_set_70/results/{}.gff' :::: short_chr_names

cat set_70_output/results_set_70/results/*gff > set_70_output/results_set_70/results/All_Chr_anotation.gff

# Get the genes from gff
grep -Po "gene=\K.*?;" set_70_output/results_set_70/results/All_Chr_anotation.gff | sed 's/;//g' | uniq > set_70_output/results_set_70/tmp/list_unique_ids.txt
grep -f set_70_output/results_set_70/tmp/list_unique_ids.txt set_70_output/results_set_70/results/All_Chr_anotation.gff | awk '{print $(NF-9),$(NF-7),$(NF-6),$(NF-5),$(NF-4),$(NF-3),$(NF-2),$(NF-1)}' > set_70_output/results_set_70/tmp/out.txt
grep -Po "gene=\K.*?;" set_70_output/results_set_70/results/All_Chr_anotation.gff | sed 's/;//g' > set_70_output/results_set_70/tmp/list_ids.txt
paste set_70_output/results_set_70/tmp/list_ids.txt set_70_output/results_set_70/tmp/out.txt > set_70_output/results_set_70/results/set_70_Final_Genes_Scored.txt
