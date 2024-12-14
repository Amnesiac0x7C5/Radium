%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"

%}

%option noyywrap

%%
"function"    { return FUNCTION; }
"global"      { return GLOBAL; }
"local"       { return LOCAL; }
"return"      { return RETURN; }
"while"       { return WHILE; }
"for"         { return FOR; }
"do"          { return DO; }
"if"          { return IF; }
"elseIf"      { return ELSEIF; }
"else"        { return ELSE; }
"loop"        { return LOOP; }
"until"       { return UNTIL; }
"break"       { return BREAK; }

"=="          { return EQ; }
"~="          { return NEQ; }
"<"           { return LT; }
">"           { return GT; }
"<="          { return LTE; }
">="          { return GTE; }

"&&"          { return AND; }
"||"          { return OR; }
"~"           { return NOT; }

".."          { return CONCAT; }

[a-zA-Z_][a-zA-Z_0-9]* { return IDENTIFIER; }

[0-9]+        { return NUMBER; }

[ \t\n]+      { /* Ignore whitespace */ }

.             { return UNKNOWN; }
%%

int main(int argc, char **argv) {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
