#!/bin/sh
#BSUB -J yulin-hw2
#BSUB -o output_file_reduc30
#BSUB -e error_file_reduc30
#BSUB -n 10
#BSUB -q ht-10g
#BSUB cwd /home/zhao.y/HW2/
work=/home/zhao.y/HW2

cd $work
export OMP_NUM_THREADS=30
bin/hw2_mpreduc
