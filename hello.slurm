#!/bin/bash

#SBATCH -A hartvigsen_lab
#SBATCH --time=1:00:00
#SBATCH --partition=standard
#SBATCH --ntasks-per-node=1 # need to match number of gpus
#SBACTH --exclude=udc-an28-1,udc-an28-7
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=6GB # need to match batch size.
#SBATCH -J tutorial_rivanna # TODO: CHANGE THIS
#SBATCH -o /home/pct4et/tutorial_rivanna/log/%x-%A.log
#SBATCH -e /home/pct4et/tutorial_rivanna/log/%x-%A.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pct4et@virginia.edu

module load miniforge

echo "The current node is (from running hostname) is $(hostname). "
echo "SLURM_JOB_NODELIST=${SLURM_JOB_NODELIST}" # TODO: need to process SLURM_JOB_NODELIST if using multi-node training

echo "Running nvidia-smi"
/usr/bin/nvidia-smi

python hello.py
