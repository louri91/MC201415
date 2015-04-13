%{
#include <stdio.h>

/* extern FILE *commentFile, *localVarFile, *codeFile */

%}

whitespace [\n\t ]*
any	   .*

%%
\/\*[^/*]*\*\/			{yytext[0]=yytext[1]=yytext[yyleng-1]=yytext[yyleng-2]=' ';printf("Comentario:""%s",yytext);}
"\n" 					{printf("Comentario:""%s", yytext);}
. 						{printf("Comentario:""%s", yytext);}
%%

int main() {
	return 0;
}