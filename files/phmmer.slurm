#!/bin/bash

#SBATCH --job-name="phmmer_serial"
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:01:00
#SBATCH --reservation=PATC-BIO1

export PATH=$PATH:/gpfs/projects/nct00/nct00003/hmmer/3.3.2/bin

phmmer --cpu 1 --noali -E 1e-100 P01024.fasta uniprot_sprot_mammals.dat

