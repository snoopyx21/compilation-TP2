%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(char * error);

%}

%%

/* Règles de traduction */
S:  C C '\n'    { printf("S-> c C\n"); }
 ;

S: S '\n'
 '\n'
 ;

C:  'c' C   { printf("C-> c C\n"); }
 |  'd'     { printf("C-> d\n"); }
 ;

%%
/* Fonctions auxiliaires */
int yylex()
{
    return getchar();
}
void yyerror(char * error)
{
    fprintf(stderr, "Yacc erreur %s\n", error);
    exit(0);
}
int main(void)
{
    printf("hello.yacc\n");
    yyparse(); // utilise Lex
    return 0;
}