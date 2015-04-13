                 /*----- Sección de Declaraciones --------------*/ 
%{
#include <stdio.h>
%}

whitespace [\n\t ]*
any	   .*

%%
"http://"|"www."[a-z]*			{yytext[0]=yytext[1]=yytext[yyleng-1]=yytext[yyleng-2]=' ';printf("Pagina Web:""%s",yytext);}
[a-z]*[0-9]*"@"[a-z]*\."es"|"com" 					{printf("Pagina Web:""%s", yytext);}
%%

int main() {
	return 0;
}