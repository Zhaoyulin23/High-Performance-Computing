#!/bin/sh
#BSUB -J yulin
#BSUB -o output_openmp4
#BSUB -e errorfile
#BSUB -n 10
#BSUB -q ht-10g
#BSUB cwd /home/zhao.y/HW5/
work=/home/zhao.y/HW5

cd $work
export OMP_NUM_THREADS=1
sobel_openmp4