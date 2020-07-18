#include <stdio.h>
/*
不同类型数据间的混合运算,及类型之间的转换
*/
float test1();
char test_uper_to_lower();
int char_to_int();
short int_to_short();
float float_use_e();
int main(){
	float test1_value=test1();
	char test_uper_to_lower_value=test_uper_to_lower();
	printf("test1_value=%10.3f\n",test1_value);
	printf("test_uper_to_lower_value=%c\n",test_uper_to_lower_value);
	char_to_int();
	int_to_short();
	float_use_e();
	return 0;
}

float test1(){
	int i,f;
	float d=3.0;
	i=10;
	f=2;
	float sum=10+'a'+i*f-d/3;
	return(sum);
}

char test_uper_to_lower(){
	char c1,c2;
	c1='A';
	c2=c1+32;
	return(c2);
}
int char_to_int(){
	char c='a';
	printf("'a' to int is:%d\n",c);

}
short int_to_short(){
	int a=32767;
	short b;
	b=a+1;
	printf("%d is changed to %d\n",a,b);
}
// e格式符
float float_use_e(){
	float a;
	printf("please input a float number!\n");
	scanf("%f",&a); //scanf()的返回值1代表成功读取，2表示读取失败。
	printf("a=%f\n",a);
	printf("a=%15.5e\n",a);
	printf("a=%e\n",a);
	printf("a=%e\n",123.456);

}
