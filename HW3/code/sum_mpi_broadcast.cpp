#include<mpi.h>
#include<stdio.h>
#include<math.h>
#define N 1000

int main(int argc, char **argv){
	int numnodes,myrank;
	int vect1[N];
	int i,count;
	int low,high;
	long partsum,total;
	
	MPI_Init(&argc,&argv);
	MPI_Comm_size(MPI_COMM_WORLD,&numnodes);
	MPI_Comm_rank(MPI_COMM_WORLD,&myrank);
	//create data to be sent on the root
	if(myrank==0){
		for(i=0;i<N;i++)
			vect1[i]=i+1;
	}
	
	//broadcast data
	MPI_Bcast(vect1,N,MPI_INT,0,MPI_COMM_WORLD);
	//add portion of data
	count=N/numnodes;
	low=myrank*count;
	partsum=0;
	if(myrank!=(numnodes-1))
	{
		high=low+count;
	}else{
		high=N;
	}
	for(i=low;i<high;i++)
		partsum +=vect1[i];
	printf("Processor %d partial sum: %d\n",myrank,partsum);
	
	//compute total sum
	MPI_Reduce(&partsum,&total,1,MPI_LONG,MPI_SUM,0,MPI_COMM_WORLD);
	if(myrank==0)
		printf("Result from all processors:%d",total);
	MPI_Finalize();
	
}
