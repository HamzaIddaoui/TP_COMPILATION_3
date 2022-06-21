%{
	#include<stdio.h>
	int flag=0;
	void yyerror (char *s);
	int yylex();
	extern FILE *yyin;
	extern char* yytext;
%}

%token DEBUT FIN AF ENTIER REEL ID PLUS MINUS DIVIDE MULTIPLY PV

%% 
S:DEBUT ListOper FIN {printf("Debut \n%s\n",$2);};
ListOper: Oper ListOper | Oper;
Oper: ID AF EXP PV
|ID AF nb PV
|ID AF ID PV;
EXP: ELEM PLUS ELEM
|ELEM MINUS ELEM
|ELEM DIVIDE ELEM
|ELEM MULTIPLY ELEM;
ELEM: nb|ID;
nb: ENTIER
|REEL;



%%

void main()
{ 
    FILE *fp;
    fp = fopen("TP3.txt","r");
    yyin = fp;
    yyparse();
    printf("Programme Valide!");
}
void yyerror(char *s) {printf("Erreur : %s\n",s);}