#ifdef _WIN32

#include <io.h>
#define isatty _isatty

#include <stdio.h>
#define fileno _fileno

#endif // _WIN32
