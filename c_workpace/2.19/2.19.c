#include <stdio.h>
/*
计算多项式 1 -1/2 +1/3 -1/4 +....+1/99 -1/100
*/
int main(){
	int sigh=1;
	double deno=2,sum=1,term;
	while(deno<=100){
		sigh=-sigh;
		term=sigh/deno;
		sum+=term;
		deno+=1;
	}
	printf("%f\n",sum);
	return 0;
}
