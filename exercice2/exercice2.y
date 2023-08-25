%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <ctype.h>
    int yylex();
    void yyerror(char * error);

%}
%token NUM
%left '-' 
%left '+'
%left '*'
%start ligne
%%

/* Règles de traduction */
ligne: E '\n' { printf ("%d\n",$1); }
 ;
E:  E '+' E { 
                printf("E = E + E\n");
                $$ = $1 + $3; 
            }
 ;
E:  E '*' E { 
                printf("E = E * E\n");
                $$ = $1 * $3; 
            }
 ;
E:  E '-' E { printf("E = E - E\n"); $$ = $1 - $3; }
 ;
E:  '(' E ')' 
            { 
                printf("E : (E)\n");
                $$ =  $2; 
            }
 ;
E: NUM  {   
            printf("E : NUM (%d)\n", $1);
            $$ = $1; 
        }
 ;
E: '\n'
 | E '\n'
 ;

%%
/* Fonctions auxiliaires */
/*int yylex()
{
    int c;
    while ((c = getchar()) == ' ')
    {
        if (isdigit(c) )
        {
            yylval = c - '0';
            return (NUM);
        }
    }
    return (c);
}*/
void yyerror(char * error)
{
    fprintf(stderr, "Yacc erreur %s\n", error);
    exit(0);
}
int main(void)
{
    printf("exo2.yacc\n");
    yyparse(); // utilise Lex
    return 0;
}