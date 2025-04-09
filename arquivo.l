/*expressões regulares*/
INT [0-9]+
FLOAT [0-9]+\.[0-9]+
STR \"[^\"]*\"
BOOL (true|false)

OP [-+*/]
OP2 [(){}.;#]

INCLUDE "<"[A-Za-z0-9]+\.[hH]">"


COMENT (\/\/.*|\#.*)

ATRIB =
CONDI (if|else|elif)
LOGIC (<=|>=|==|!=|<|>|&&|&)

REPET (for|do|while)
FUNC (printf|scanf|Switch|System|return|include|main)
TIPO (int|float|str|bool)

ID [A-Za-zÀ-ÿ][A-Za-zÀ-ÿ0-9]*

IGN [ \t\n\r]*


/* token */
%%
"INICIO" {printf("\n[INICIO]\n\n");}
"FIM" {printf("\n[FIM]\n\n");}
{INCLUDE} {printf("INCLUDE: %s\n",yytext);}
{COMENT} {printf("\nCOMENT: %s\n\n",yytext);}
{STR} {printf("STR: %s\n",yytext);}
{TIPO} {printf("TIPO: %s\n",yytext);}
{FUNC} {printf("FUNC: %s\n",yytext);}
{BOOL} {printf("BOOL: %s\n", yytext);}
{CONDI} {printf("COND: %s\n",yytext);}
{REPET} {printf("REPET: %s\n",yytext);}
{LOGIC} {printf("LOGIC: %s\n",yytext);}
{INT} {printf("INT: %s\n",yytext);}
{FLOAT} {printf("FLOAT: %s\n",yytext);}
{OP} {printf("OP: %s\n",yytext);}
{OP2} {printf("OP2: %s\n",yytext);}
{ATRIB} {printf("ATRIB: %s\n",yytext);}
{ID} {printf("VAR: %s\n",yytext);}
{IGN} {}
%%

/*definições*/
int main(){
    printf("\n\n\n");
    yyin=fopen("entrada.txt","r");
    yylex();
    fclose(yyin);
return 0;
}