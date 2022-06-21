%option noyywrap
%{
	#include<stdio.h>
	#include "TP3.tab.h"
%}

entier ("+"|"-")?[0-9]*
reel ("+"|"-")?[0-9]+"."[0-9]+
id [a-zA-Z][a-zA-Z0-9_]*

%%

"debut" return DEBUT;
"fin" return FIN;
":=" return AF;
"+" return PLUS;
"-" return MINUS;
"/" return DIVIDE;
"*" return MULTIPLY;
";" return PV;
{entier} { yylval = atoi(yytext) ; return ENTIER; } 
{reel} { yylval = atoi(yytext); return REEL;}
{id} { yylval = (int)yytext ; return ID; } 
"/*"(.|"\n")+"*/"
[ \t\n]
. printf("Erreur lexicale (%s)",yytext);

%%