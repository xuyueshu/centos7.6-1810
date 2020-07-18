#include <stdio.h>
/*
计算5!
*/
int main(){
	int i,t;
	i=5;
	t=5;
	while(i>1){
		i-=1;
		t*=i;
	}
	printf("%d\n",t);
	return 0 ;
}
