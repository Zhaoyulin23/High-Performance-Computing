#!/bin/sh
#BSUB -J yulin-hw2
#BSUB -o output_file_se
#BSUB -e error_file_se
#BSUB -n 10
#BSUB -q ht-10g
#BSUB cwd /home/zhao.y/HW2/
work=/home/zhao.y/HW2

cd $work
export OMP_NUM_THREADS=20
bin/hw2-sequential
