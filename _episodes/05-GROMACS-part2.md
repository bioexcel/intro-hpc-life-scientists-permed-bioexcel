---
title: "PRACTICAL: Benchmarking Molecular Dynamics Using GROMACS 2"
teaching: 10
exercises: 20
questions:
- "How do we run hybrid MPI and OpenMP jobs on MareNostrum?"
- "Does adding OpenMP to MPI GROMACS  performance?"
objectives:
- "Run a hybrid MPI with OpenMP simuation on MareNostrum."
- "See how GROMACS performance is changed by including OpenMP."
keypoints:
- "Hybrid MPI with OpenMP does affect performance."
- "When running hybrid jobs, placement across NUMA regions is important."
---

## Aims

GROMACS can  run  in  parallel using  MPI  and  simultaneously  also  using
OpenMP  threads (see [here](http://manual.gromacs.org/current/user-guide/mdrun-performance.html#multi-level-parallelization-mpi-and-openmp)).
In this tutorial, you will learn how to run hybrid MPI and OpenMP jobs on
MareNostrum, and you will benchmark the performance of the `bechMEM` system to see
whether performance improves when using OpenMP threads.

## Hybrid MPI and OpenMP jobs on MareNostrum

When running hybrid MPI (with the individual tasks also known as ranks or
processes) and OpenMP (with multiple threads) jobs you need to leave free
cores between the parallel tasks launched using `srun` for the multiple
OpenMP threads that will be associated with each MPI task.

As we saw above, you can use the options to `sbatch` to control how many
parallel tasks are placed on each compute node and can use the
`--cpus-per-task` option to set the stride between parallel tasks
to the right value to accommodate the OpenMP threads. The value
of `--cpus-per-task` should usually be the same as that for
`OMP_NUM_THREADS`.

As an example, consider the job script below that runs across 1 nodes with
24 MPI tasks per node and 2 OpenMP threads per MPI task (so all 48 cores
are used). You can find a copy of this script at: 
/gpfs/projects/nct00/nct00004/GROMACS_practicals/sub_prac2.slurm`.

```
#!/bin/bash

#SBATCH --qos=debug
#SBATCH --time=0:5:0
#SBATCH --nodes=1
#SBATCH --cpus-per-task=24
#SBATCH --tasks-per-node=2

module load intel/2020.1
module load impi/2018.4
module load mkl/2020.1
module load gcc/9.2.0
module load gromacs/2021.2

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

srun gmx_mpi mdrun -ntomp ${SLURM_CPUS_PER_TASK} -s benchMEM.tpr

```
{: .language-bash}

Each MareNostrum compute node is made up of 2 sockets, each with 24 cores. 
Programs where the threads span both sockets are likely to be *less* efficient
as the primary memory available to these threads will be spread between both sockets.

## Instructions

For this tutorial, you will start by comparing the performance of a simulation
that uses all of the cores on a node. Using the code above as a template, try
running simulations that use varying levels of MPI and OpenMP (making sure
that the number of MPI ranks and OpenMP threads always multiply to 128 or
less). How do the simulation times change as you increase the numbers change?
How do these times change if you do not spread the threads over the NUMA
regions as suggested?

You may find it helpful to fill out this table

| MPI Ranks | OpenMP threads | Walltime (s) | performance (ns/day) |
|-----------|----------------|--------------|----------------------|
|        48 |              1 | | |
|        24 |              2 | | |
|        16 |              3 | | |
|        12 |              4 | | |
|         9 |              5 | | |
|         8 |              6 | | |
|         4 |             12 | | |
|         2 |             24 | | |

## Load balancing

GROMACS performs dynamic load balancing when it deems necessary. Can you tell
from your md.log files so far whether it has been doing so, and what it
calculated the load imbalance was before deciding to do so?

To demonstrate the effect of the load imbalance counteracted by GROMACS’s
dynamic load balancing scheme, investigate what happens when this is turned
off by including the `-dlb no` option to `gmx_mpi mdrun`. How does removing 
load balancing affect the simulation runtime? Does this effect change as the 
number of cores used increases?

{% include links.md %}
