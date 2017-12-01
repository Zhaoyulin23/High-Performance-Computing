#!/bin/sh
#BSUB -J tancheng-hw2
#BSUB -o output_file_se
#BSUB -e error_file_se
#BSUB -n 10
#BSUB -q ht-10g
#BSUB cwd /home/zhuang.t/HW2/
work=/home/zhuang.t/HW2

cd $work
export OMP_NUM_THREADS=20
bin/hw2-sequential
