%{
/* Structure fichier Yacc 
 * Déclaration 
 * yacc hello.y
 * ls
 *  y.tab.c ...
 * gcc y.tab.c -ly
*/
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(char * error);

%}

%%

/* Règles de traduction */
S: ;

%%
/* Fonctions auxiliaires */
int yylex()
{
    return 0;
}
void yyerror(char * error)
{
    fprintf(stderr, "Yacc erreur %s\n", error);
    exit(0);
}
int main(void)
{
    printf("hello.yacc\n");
    return 0;
}