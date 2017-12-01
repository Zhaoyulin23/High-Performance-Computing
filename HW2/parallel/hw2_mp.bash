#!/bin/sh
#BSUB -J YulinZhao-hw2
#BSUB -o output_file_mp30
#BSUB -e error_file_mp30
#BSUB -n 10
#BSUB -q ht-10g
#BSUB cwd /home/zhao.y/HW2/
work=/home/zhao.y/HW2

cd $work
export OMP_NUM_THREADS=30
bin/hw2_mp
