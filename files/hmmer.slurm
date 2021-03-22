#!/bin/bash --login

#SBATCH --job-name=hmmer
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=0:5:0
#SBATCH --account=ta017
#SBATCH --partition=standard
#SBATCH --qos=standard
#SBATCH --reservation=ta017_138

# Setup the batch environment
module load epcc-job-env

# Set the PATH to include HMMER
export PATH=/work/ta017/ta017/$USER/hmmer/bin:$PATH

# srun launches the parallel program based on the SBATCH options
srun --distribution=block:block --hint=nomultithread phmmer --cpu=1 --noali -E 1e-100 P01024.fasta uniprot_sprot_mammals.dat 

