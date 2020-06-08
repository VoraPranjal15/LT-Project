	
%{
#include<stdio.h> 
#include<math.h>
extern FILE *yyin;
#define PI 3.14
%} 
 
%union
{
int integer;
float real;
}
%token <integer> NUMBER <real>	FLOAT
%token find area volume of circle square sphere cone having radius length height and  
%type <real> S E T U F
%%

S: find E{$$=$2;};
E:  area of T             {$$=$3;}
   |volume of U           {$$=$3;}
   ;
T: circle having radius NUMBER   {$$=PI*$4*$4;printf("Area of circle having radius %d is %f\n",$4,$$);}
  |square having length NUMBER   {$$=$4*$4;printf("Area of square having length %d is %f\n",$4,$$);}
  ;
U: sphere having radius NUMBER   {$$=(4*PI*$4*$4*$4)/3;printf("Volume of sphere having radius %d is %f\n",$4,$$);}
  |cone having F                 {$$=$3;}      
  ;
F: radius FLOAT and height FLOAT   {$$=(PI*$2*$2*$5)/3; printf("Volume of cone having radius %f and height %f is %f\n",$2,$5,$$);};

%%
void yyerror(char *s){}
int main(int argc, char *argv[]) 
{
yyin=fopen(argv[1],"r");
int i;
for(i=1;i<=4;i++)
{
yyparse();
}
fclose(yyin);
return 0;
}

