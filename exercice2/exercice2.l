%{
    #include <stdlib.h>
    #include <string.h>
    #include "y.tab.h"
%}

%%

[0-9]+  { yylval = atoi(yytext);
         return NUM; 
        }
[()+*] { return yytext[0]; }
[\n] { return yytext[0]; }
. { printf("Non reconnu\n : %s", yytext); }

%%