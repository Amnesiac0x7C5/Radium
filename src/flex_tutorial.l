/* Definitions Section */
%{

    int count = 0;

%}
    
/* Rules Section */
%%

[a-z] { printf("Single Lower Case Character.\n"); count++; }
.     { printf("Not a Lower Case Character.\n"); }
\n    { return 0; }


%%

/* Wrapper */
int yywrap() { return 0;}

/* Driver Function */
int main() 
{
    printf("Enter string: ");
    yylex(); /* Takes the input and do the rule matching */
    printf("There were %d lowercase characters.\n", count);
    return 0;
}
