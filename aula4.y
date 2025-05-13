%{
#include <stdio.h>
#include <math.h>
#include <string.h>

float var[26];

int yylex();
void yyerror (char *s){
	printf("%s\n", s);
}

%}

%union{
	float flo;
	int inte;
	char *str;
	}

%token <str> STR
%token <flo>NUM
%token <inte>VARS
%token PRINT
%token LEIA
%token FIM
%token INI
%left '+' '-'
%left '*' '/'
%right '^'
%right NEG
%type <flo> exp
%type <flo> valor


%%

prog: INI cod FIM
	;

cod: cod cmdos
	|
	;

cmdos: PRINT '(' args ')' {
						printf ("\n");
						}
	| VARS '=' exp {
					var[$1] = $3;
					}
	| LEIA '(' VARS ')' {
		 scanf("%f", &var[$3]); 
	}
	;

args: args ',' arg { } | arg { };

arg: STR  { printf("%s", $1); free($1); }
    | exp { printf("%.2f", $1); }
    ;

exp: exp '+' exp {$$ = $1 + $3;}
	|exp '-' exp {$$ = $1 - $3;}
	|exp '*' exp {$$ = $1 * $3;}
	|exp '/' exp {$$ = $1 / $3;}
	|'(' exp ')' {$$ = $2;}
	|exp '^' exp {$$ = pow($1,$3);}
	|'-' exp %prec NEG {$$ = -$2;}
	|valor {$$ = $1;}
	|VARS {$$ = var[$1];}
	;

valor: NUM {$$ = $1;}
	;

%%

#include "lex.yy.c"

int main(){
	yyin=fopen("entrada.txt","r");
	yyparse();
	fclose(yyin);
	return 0;
}
