#include<stddef.h>
#include<stdlib.h>
#include<stdio.h>
#include<mpi.h>

int main(int argc, char **argv){
	char message[40];
	int i, rank, size, type=99;
	MPI_Status status;
	MPI_Init(&argc,&argv);
	MPI_Comm_size(MPI_COMM_WORLD,&size);
	MPI_Comm_rank(MPI_COMM_WORLD,&rank);
	if(rank==0){
		strcpy(message, "Hello world from Yulin Zhao!");
		for(i=1;i<size;i++)
			MPI_Send(message,34,MPI_CHAR,i,type,MPI_COMM_WORLD);
	}else
	MPI_Recv(message,34,MPI_CHAR,0,type,MPI_COMM_WORLD,&status);
	printf("Message from process =%d : %s\n", rank, message );
	MPI_Finalize();
	return 0;
	
}