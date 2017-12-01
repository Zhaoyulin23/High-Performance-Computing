#!/bin/sh
#BSUB -J tancheng-hw2
#BSUB -o output_file_reduc30
#BSUB -e error_file_reduc30
#BSUB -n 10
#BSUB -q ht-10g
#BSUB cwd /home/zhuang.t/HW2/
work=/home/zhuang.t/HW2

cd $work
export OMP_NUM_THREADS=30
bin/hw2_mpreduc
