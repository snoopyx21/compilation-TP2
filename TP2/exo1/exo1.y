%{
	#include <stdio.h>
	int yylex();
	void yyerror(char*);
%}

%%

S: C C '\n' {printf("S-> C C\n MATCH\n");}
  ;

C: 'c' C {printf("C-> c C\n");}
  | 'd'   {printf("C-> d\n");}
  ;

%%

int main()
{
	printf("hello\n");
	yyparse();
	return 0;
}
