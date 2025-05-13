%{
	#include <stdlib.h>
	#include <string.h>
	char aux[30];
%}

NUM [0-9]+\.?[0-9]*
VARS [a-z]
PRINT "mostrar"
LEIA "leia"
INI "INICIO"
FIM "FIM"
STR \"[^\"]*\"

%%
{STR} {
    char *s = strndup(yytext + 1, strlen(yytext) - 2);
    yylval.str = s;
    return STR;
}

{NUM} {
	yylval.flo = atof(yytext);
	return NUM;
	}
	
{VARS} {
	yylval.inte = *yytext - 'a';
	return VARS;
	}
	
{PRINT} { return PRINT; }
{LEIA} { return LEIA; }
[-+()=/*^,] { return *yytext; }
{INI} { return INI;	}			
{FIM} { return FIM;	}	
		
[\ \n\t]*	{;}
. {printf("(%s) Ingonrado\n",yytext);}
%%