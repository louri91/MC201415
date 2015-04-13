%{
#include <stdio.h>
%}

whitespace [\n\t ]*
any	   .*

%%
[0-3]\/[0-9]\/[0-1]\/[0-9]\/[0-2]\/[0-9]\/[0-9]\/[0-9]				{yytext[0]=yytext[1]=yytext[yyleng-1]=yytext[yyleng-2]=' ';printf("Fecha:""%s",yytext);}
[0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z] 								{printf("Matrícula:""%s", yytext);}
[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]						{printf("DNI:""%s", yytext);}
[0-9][0-9][0-9][0-9][0-9]											{printf("Codigo Postal:""%s", yytext);}
[69][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]						{printf("Telefono:""%s", yytext);}
%%

int main() {
	return 0;
}