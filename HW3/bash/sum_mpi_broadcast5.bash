#!/bin/sh
#BSUB -J Yulin-sum
#BSUB -o sum_output_file
#BSUB -e sum_error_file
#BSUB -n 5
#BSUB -q ht-10g
#BSUB cwd /home/zhao.y/HW3
work=/home/zhao.y/HW3
cd $work
tempfile1=hostlistrun
tempfile2=hostlist-tcp

echo $LSB_MCPU_HOSTS > $tempfile1
declare -a hosts
read -a hosts < ${tempfile1}
for ((i=0; i<${#hosts[@]}; i+=2));
  do
    HOST = ${hosts[$i]}
    CORE= ${hosts[(($i+1))]}
    echo $HOST:$CORE >> $tempfile2
done

mpirun -np 5 -prot -TCP -lsf ./bin/sum_mpi_broadcast