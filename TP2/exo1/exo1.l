%{
	#include <stdio.h>
%}


%%

[cd\n]	{ printf("Lex: %s \n",yytext);
	  return yytext[0];
	}

.	{ printf("Lex : %s\n",yytext); }

%%

