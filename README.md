# Radium

## Dependencies

### Flex 2.6.4 & Bison 3.8.2
For Linux, use your package manager to get Flex and Bison.
Debian-based distributions may be like the following:
`sudo apt update`
`sudo apt install flex bison`
Check your package manager for your specific distribution. 


For Windows, get it at this link:
[https://sourceforge.net/projects/winflexbison/](https://sourceforge.net/projects/winflexbison/).
Extract the contents and copy the files to the `win` directory. The Makefile will
expect these to be there. 

### Clang
Clang is used as the compiler for both Windows and Linux. Use a package manager to install it to your system. 

For Windows: download it here [https://github.com/llvm/llvm-project/releases/tag/llvmorg-18.1.8](https://github.com/llvm/llvm-project/releases/tag/llvmorg-18.1.8) or use a package manager. This will also require an installation of 
Microsoft Visual Studio for their C++ compiler suite (Build Tools also works) for the linker. 

### Make
GNU Make is the build system. 

Linux likely already has it. 

For Windows, you can use nearly any port (ie mingw ports), use a package manager (ie scoop) or build the source code yourself from here: [https://ftp.gnu.org/gnu/make/make-4.4.tar.gz](https://ftp.gnu.org/gnu/make/make-4.4.tar.gz).

## Building Radium
After setting up the dependencies, run `make all` and Radium will build. 

