#!/bin/sh
#BATCH --job-name="it_mult_vec"
#SBATCH --output="it_mult_vec.%j.out"
#SBATCH --partition=gpu-shared
#SBATCH --gres=gpu:k80:1
#SBATCH --ntasks-per-node=6
#SBATCH --export=ALL
#SBATCH -t 00:03:00


./it_mult_vec_test
