%{
#include "tabsim.c"
void yyerror(char *);
int yylex(void);
simbolo *t;
%}
%union {
	int numero;
	simbolo * ptr_simbolo;
}

%token <numero> NUMERO
%token <ptr_simbolo> ID
%type <numero> expr asig prog
%start prog
%left '+'
%left '*'
%%
prog: 		
	prog asig '\n'		{ printf("Asignacione(s) efectuada(s)\n");}
	| prog expr '\n'	{ printf("%d\n",$2);}
	| prog error '\n' 	{ yyerrok;}
	|			{;}
	;
asig: 		
	ID '=' expr 	{
				$$ = $3;
				$1->valor = $3;									
			}	
	| ID '=' asig	{
				$$ = $3;
				$1->valor = $3;									
			}					
	;
expr: 		
	expr '+' expr 		{$$ = $1 + $3;}
	| expr '*' expr 	{$$ = $1 * $3;}
	| ID 			{$$ = $1->valor; }
	| NUMERO 		{$$ = $1;}	
	;
%%
void yyerror(char *s)
{
	extern int yylineno;	// predefinida en lex.c
	extern char *yytext;	// predefinida en lex.c
	printf("ERROR: %s en simbolo \"%s\" en linea %d \n",s,yytext,yylineno); 
}
void main()
{ 
	t = crear();
	yyparse();		
	imprimir(t);
}
