%option noyywrap

/* Definitions Section */
%{
    int num_lines = 0;
    int num_chars = 0;
%}
    

/* The '%top' tag puts the bracketed code at the top of the generated
 * source file.
 */
%top{

// This helps the Flex-generated file compile on Windows.
#ifdef _WIN32

#define YY_NO_UNISTD_H

#include <io.h>
#define isatty _isatty

#include <stdio.h>
#define fileno _fileno

#endif // _WIN32

}

/* Rules Section */
%%

\n    ++num_lines; ++num_chars;
.     ++num_chars;


%%


/* Driver Function */
int main() 
{
    yylex(); /* Takes the input and do the rule matching */
    printf("# of lines = %d, # of chars = %d\n", num_lines, num_chars);

    return 0;
}
