/* Not yet using multiple input files, so disable this to silence some compiler warnings */
%option noyywrap

/* Definitions Section */
%{
    int num_words = 0;
    int num_lines = 0;
    int num_chars = 0;
%}
    

/* The '%top' tag puts the bracketed code at the top of the generated
 * source file.
 */
%top{

// This helps the Flex-generated file compile on Windows.

// Windows
#ifdef _WIN32

#define YY_NO_UNISTD_H

#include <stdio.h>
#define fileno _fileno

#include <io.h>
#define isatty _isatty

#endif

// Linux
#ifdef __linux__

#define _POSIX_C_SOURCE 1

#endif 

}

/* Rules Section */
%%

.         { ++num_chars; }
\n         { ++num_lines; ++num_chars; }
[^ \t\n]+  { ++num_words; }




%%


/* Driver Function */
int main( int argc, char **argv )
{
	if ( argc == 2 ){
		yyin = fopen( argv[1], "r" );
	}else{
		yyin = stdin;
	}
	
	yylex();
    	printf("chars words lines: %d %d %d\n", num_chars, num_words, num_lines);
	
	return 0;
}
