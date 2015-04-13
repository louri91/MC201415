%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int list_type;
%}

%option       noyywrap nounput yylineno
%x            COMMENT PARA PRE OL UL LI

%%

"<h1>"[^<]*"</h1>"  {
    yytext[yyleng-5] = 0;
    fprintf(yyout,"\\section{%s}\n", yytext+4 );
}

"<h2>"[^<]*"</h2>"  {
    yytext[yyleng-5] = 0;
    fprintf(yyout, "\\subsection{%s}\n", yytext+4 );
}

"<h3>"[^<]*"</h3>"  {
    yytext[yyleng-5] = 0;
    fprintf(yyout, "\\subsubsection{%s}\n", yytext+4 );
}

"<pre>"  {
    fprintf(yyout, "\\begin{verbatim}\n", yytext);
    BEGIN PRE;
}

<PRE>.  {
    fprintf(yyout, "%s", yytext );
}

<PRE>"</pre>"   {
    fprintf(yyout, "\\end{verbatim}\n", yytext);
    BEGIN 0;
}

<PRE>"<b>"[^<]*"</b>"  {
    yytext[yyleng-4] = 0;
    fprintf(yyout, "\\textbf{%s}", yytext+3 );
}

<PRE>"<i>"[^<]*"</i>"  {
    yytext[yyleng-4] = 0;
    fprintf(yyout, "\\textit{%s}", yytext+3 );
}

<PRE>"<small>"[^<]*"</small>"  {
    yytext[yyleng-8] = 0;
    fprintf(yyout, "\\scriptsize{%s}", yytext+7 );
}

<PRE>"<big>"[^<]*"</big>"  {
    yytext[yyleng-6] = 0;
    fprintf(yyout, "\\Large{%s}", yytext+5 );
}

"<p>"   {
    fprintf(yyout, "\\paragraph{1} ", yytext);
    BEGIN PARA;
}

<PARA>. {
    fprintf(yyout,"%s",yytext);
}

<PARA>"</p>"    {
    fprintf(yyout,"\n",yytext);
    BEGIN 0;
}

<PARA>"<b>"[^<]*"</b>"  {
    yytext[yyleng-4] = 0;
    fprintf(yyout, "\\textbf{%s}", yytext+3 );
}

<PARA>"<i>"[^<]*"</i>"  {
    yytext[yyleng-4] = 0;
    fprintf(yyout, "\\textit{%s}", yytext+3 );
}

<PARA>"<small>"[^<]*"</small>"  {
    yytext[yyleng-8] = 0;
    fprintf(yyout, "\\scriptsize{%s}", yytext+7 );
}

<PARA>"<big>"[^<]*"</big>"  {
    yytext[yyleng-6] = 0;
    fprintf(yyout, "\\Large{%s}", yytext+5 );
}

<PARA>"<strong>"[^<]*"</strong>"  {
    yytext[yyleng-9] = 0;
    fprintf(yyout, "\\textmd{%s}", yytext+8 );
}

<PARA>"<em>"[^<]*"</em>"  {
    yytext[yyleng-5] = 0;
    fprintf(yyout, "\\emph{%s}", yytext+4 );
}

<PARA>"<sup>"[^<]*"</sup>"  {
    yytext[yyleng-6] = 0;
    fprintf(yyout, "\\textsuperscript{%s}", yytext+5 );
}

<PARA>"<sub>"[^<]*"</sub>"  {
    yytext[yyleng-6] = 0;
    fprintf(yyout, "\\textsubscript{%s}", yytext+5 );
}

"<ol>"  {
    fprintf(yyout, "\\begin{enumerate}\n");
    BEGIN OL;
}

<OL>. {
    fprintf(yyout,"%s",yytext);
}

<OL>"<li>"  {
    fprintf(yyout,"\\item ",yytext);
    BEGIN LI;
}
<OL>"</ol>" {
    printf("\\end{enumerate}\n");
    BEGIN 0;
}
<OL>"<b>"[^<]*"</b>"  {
    yytext[yyleng-4] = 0;
    fprintf(yyout, "\\textbf{%s}", yytext+3 );
}

<OL>"<i>"[^<]*"</i>"  {
    yytext[yyleng-4] = 0;
    fprintf(yyout, "\\textit{%s}", yytext+3 );
}

<OL>"<ul>"  {
    fprintf(yyout, "\\begin{itemize}\n");
    BEGIN UL;
}

<OL>"<strong>"[^<]*"</strong>"  {
    yytext[yyleng-9] = 0;
    fprintf(yyout, "\\textmd{%s}", yytext+8 );
}

<OL>"<em>"[^<]*"</em>"  {
    yytext[yyleng-5] = 0;
    fprintf(yyout, "\\emph{%s}", yytext+4 );
}

"<ul>"  {
    fprintf(yyout, "\\begin{itemize}\n");
    BEGIN UL;
}

<UL>.   {
    fprintf(yyout,"%s",yytext);
}

<UL>"<li>"  {
    fprintf(yyout,"\\item ",yytext);
    BEGIN LI;
}

<UL>"</ul>" {
    fprintf(yyout, "\\end{itemize}\n");
    BEGIN 0;
}

<UL>"<ol>"  {
    fprintf(yyout,"\\begin{enumerate}\n");
    BEGIN OL;
}

<UL>"<b>"[^<]*"</b>"  {
    yytext[yyleng-4] = 0;
    fprintf(yyout, "\\textbf{%s}", yytext+3 );
}

<UL>"<i>"[^<]*"</i>"  {
    yytext[yyleng-4] = 0;
    fprintf(yyout, "\\textit{%s}", yytext+3 );
}

<UL>"<small>"[^<]*"</small>"  {
    yytext[yyleng-8] = 0;
    fprintf(yyout, "\\scriptsize{%s}", yytext+7 );
}

<UL>"<big>"[^<]*"</big>"  {
    yytext[yyleng-6] = 0;
    fprintf(yyout, "\\Large{%s}", yytext+5 );
}

<UL>"<sup>"[^<]*"</sup>"  {
    yytext[yyleng-6] = 0;
    fprintf(yyout, "\\textsuperscript{%s}", yytext+5 );
}

<UL>"<sub>"[^<]*"</sub>"  {
    yytext[yyleng-6] = 0;
    fprintf(yyout, "\\textsubscript{%s}", yytext+5 );
}

<UL>"<strong>"[^<]*"</strong>"  {
    yytext[yyleng-9] = 0;
    fprintf(yyout, "\\textmd{%s}", yytext+8 );
}

<UL>"<em>"[^<]*"</em>"  {
    yytext[yyleng-5] = 0;
    fprintf(yyout, "\\emph{%s}", yytext+4 );
}


"<li>"  {
    fprintf(yyout, "\\item %s", yytext+4);
    BEGIN LI;
}

<LI>.   {
    fprintf(yyout,"%s",yytext);
}

<LI>"<b>"[^<]*"</b>"  {
    yytext[yyleng-4] = 0;
    fprintf(yyout, "\\textbf{%s}", yytext+3 );
}

<LI>"<i>"[^<]*"</i>"  {
    yytext[yyleng-4] = 0;
    fprintf(yyout, "\\textit{%s}", yytext+3 );
}

<LI>"<small>"[^<]*"</small>"  {
    yytext[yyleng-8] = 0;
    fprintf(yyout, "\\scriptsize{%s}", yytext+7 );
}

<LI>"<big>"[^<]*"</big>"  {
    yytext[yyleng-6] = 0;
    fprintf(yyout, "\\Large{%s}", yytext+5 );
}

<LI>"<sup>"[^<]*"</sup>"  {
    yytext[yyleng-6] = 0;
    fprintf(yyout, "\\textsuperscript{%s}", yytext+5 );
}

<LI>"<sub>"[^<]*"</sub>"  {
    yytext[yyleng-6] = 0;
    fprintf(yyout, "\\textsubscript{%s}", yytext+5 );
}

<LI>"</li>" {
    fprintf(yyout,"\n",yytext);
    BEGIN UL;
}

<LI>"<strong>"[^<]*"</strong>"  {
    yytext[yyleng-9] = 0;
    fprintf(yyout, "\\textmd{%s}", yytext+8 );
}

<LI>"<em>"[^<]*"</em>"  {
    yytext[yyleng-5] = 0;
    fprintf(yyout, "\\emph{%s}", yytext+4 );
}


"<small>"[^<]*"</small>"  {
    yytext[yyleng-8] = 0;
    fprintf(yyout, "\\scriptsize{%s}", yytext+7 );
}

"<big>"[^<]*"</big>"  {
    yytext[yyleng-6] = 0;
    fprintf(yyout, "\\Large{%s}", yytext+5 );
}

"<b>"[^<]*"</b>"  {
    yytext[yyleng-4] = 0;
    fprintf(yyout, "\\textbf{%s}", yytext+3 );
}

"<i>"[^<]*"</i>"  {
    yytext[yyleng-4] = 0;
    fprintf(yyout, "\\textit{%s}", yytext+3 );
}

"<strong>"[^<]*"</strong>"  {
    yytext[yyleng-9] = 0;
    fprintf(yyout, "\\textmd{%s}", yytext+8 );
}

"<em>"[^<]*"</em>"  {
    yytext[yyleng-5] = 0;
    fprintf(yyout, "\\emph{%s}", yytext+4 );
}

"<sup>"[^<]*"</sup>"  {
    yytext[yyleng-6] = 0;
    fprintf(yyout, "\\textsuperscript{%s}", yytext+5 );
}

"<sub>"[^<]*"</sub>"  {
    yytext[yyleng-6] = 0;
    fprintf(yyout, "\\textsubscript{%s}", yytext+5 );
}


"<!--"  {
    fprintf(yyout, "%% ", yytext);
    BEGIN COMMENT;
}

[ \t\n\r]+  {
    fprintf(yyout,"%s",yytext);
}

.   {
    fprintf( stderr, "Error al completar la ejecución %d: '%s'\n", yylineno, yytext );
    exit( 1 );
}

<COMMENT>"-->"  {
    fprintf(yyout, "\n",yytext );
    BEGIN 0;
}

<COMMENT>[\n](\r)?  {
    fprintf(yyout, "\n%% ",yytext );
}

<COMMENT>[ \t]  {
    fprintf(yyout, "%s", yytext );
}

<COMMENT>.  {
    fprintf(yyout, "%s", yytext );
}
%%

extern FILE *yyin;
/**************************************************************************
 * The main function for the HTML to LateX converter. Here we do three
 * things:
 *  1. Print out the LateX document header.
 *  2. Invoke the lexer to print out the LateX document
 *  3. Print out the LateX footer.
 *************************************************************************/
int main( int argc, const char *argv[] ) {
    if(argc > 1) {
        FILE *file;
        file = fopen(argv[1], "r");

        if(!file) {
           fprintf(stderr, "Could not open %s \n", argv[1]);
           exit(1);
        }

        yyin = fopen("test.html","r");
        yyin = file;
        yyout = fopen("out.tex", "w");
    }
    fprintf(yyout, "\\documentclass[12pt]{article}\n" );
    fprintf(yyout, "\\usepackage{fixltx2e}\n" );
    fprintf(yyout, "\n" );
    fprintf(yyout, "\\setlength{\\parindent}{0.0in}\n" );
    fprintf(yyout, "\\setlength{\\parskip}{0.125in}\n" );
    fprintf(yyout, "\n\n" );
    fprintf(yyout, "\\begin{document}\n");
    yylex();
    fprintf(yyout, "\\end{document}\n");
    fclose(yyin);
    fclose(yyout);

    return 0;
}
