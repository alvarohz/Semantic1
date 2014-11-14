%{
#include "tabsim.h"
#include "y.tab.h"
#include <string.h>
extern simbolo *t;
//int yylineno = 1;
%}
%%
[0-9]+ 		{
			yylval.numero = atoi(yytext);
			return NUMERO;
		}
[-+()=/*] 	{ return *yytext; }	/* operadores */ 
[a-zA-Z][a-zA-Z0-9]*	{
			     yylval.ptr_simbolo = (simbolo *)buscar(t,yytext);
			     if (yylval.ptr_simbolo == NULL)
			     {
				yylval.ptr_simbolo=(simbolo *) malloc(sizeof(simbolo));
				strcpy(yylval.ptr_simbolo->nombre, yytext);
				yylval.ptr_simbolo->valor=0;
				insertar(&t, yylval.ptr_simbolo);
		     	     }
	        	     return ID;
			}
[ \t]       	; /* espacios en blanco */
[\n]		{yylineno++;return *yytext;}
.		yyerror("caracter no valido");
%%
int yywrap(void) {
    return 1;
}
