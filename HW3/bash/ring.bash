#!/bin/sh
#BSUB -J Yulin-ring
#BSUB -o ring_output_file
#BSUB -e ring_error_file
#BSUB -n 40
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

mpirun -np 40 -prot -TCP -lsf ./bin/ring