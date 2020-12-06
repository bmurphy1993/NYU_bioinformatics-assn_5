#!/bin/bash
#SBATCH --job-name=bed_tools
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=bem6982@nyu.edu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=24:00:00
#SBATCH --output=/gpfs/scratch/bem6982/bioinformatics/assn_05_chrom/hic-bench/pipelines/hicseq-standard/logs/bed_tools_B_%j.txt
#SBATCH -p cpu_medium


module purge
module load bedtools/2.26.0

bedtools intersect \
    -a /gpfs/scratch/bem6982/bioinformatics/assn_05_chrom/hic-bench/pipelines/hicseq-standard/__04a-compartments/results/compartments.by_sample.homer.res_100kb/filter.by_sample.mapq_20/align.by_sample.bwa/ES_1/B_compartments.bed \
    -b /gpfs/data/courses/bmscga2604/chromatin_organization/H3K27ac_ChIP_Seq/peaks_ES.bed /gpfs/scratch/bem6982/bioinformatics/assn_05_chrom/HK_genes.bed /gpfs/scratch/bem6982/bioinformatics/assn_05_chrom/gene-tss_annot.bed \
    -names H3K27ac HK TSS \
    -wo