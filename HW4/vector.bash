#!/bin/bash
export LD_LIBRARY_PATH=/usr/local/cuda/lib64 
PROGRAM_PATH=/Users/Grad/zhao.y/NEU2014/
#PBS -I nodes=1:C2075:gpus=1
GPUS_PER_NODE=2 

#PBS -N vector_cuda
${PROGRAM_PATH}vector_add 10 > ${PROGRAM_PATH}vector_add_output.txt