#include <stdio.h>
/*
华氏温度转换为摄氏温度
*/
int main(){
	float c,f;
	f=64.0;
	c=(5/9.0)*(f-32); // 5/9.0是将整数转换为浮点数。
	printf("f=%20.10f\nc=%20.10f",f,c);
	return 0;
}
