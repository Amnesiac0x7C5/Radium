%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex(void); 
void yyerror(const char *s);
%}

%token FUNCTION GLOBAL LOCAL RETURN WHILE FOR DO IF ELSEIF ELSE LOOP UNTIL BREAK
%token EQ NEQ LT GT LTE GTE AND OR NOT CONCAT
%token IDENTIFIER NUMBER
%token UNKNOWN

%%

program:
    statements
;

statements:
    statement
    | statements statement
;

statement:
    FUNCTION IDENTIFIER '(' ')' '{' statements '}'
    | RETURN expression ';'
    | IF expression statements ELSE statements
    | IDENTIFIER '=' expression ';'
;

expression:
    NUMBER
    | IDENTIFIER
    | expression EQ expression
    | expression AND expression
    | expression OR expression
    | '(' expression ')'
;

%%
