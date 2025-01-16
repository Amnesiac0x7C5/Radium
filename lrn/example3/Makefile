# Examples Directory Flex/Bison Makefile
# Windows: Requires clang + MSVC installed & Recommend Powershell 7

PROJ 	 = example
CC       = clang
CC_FLAGS = --std=c17
CC_REL   = -O2
CC_DBG   = -O0 -Wall -g

FLEX  = flex
BISON = bison
RM    = rm -f

ifeq ($(OS), Windows_NT)

PROJ        := $(PROJ).exe
SHELL       = pwsh.exe
.SHELLFLAGS = -noprofile -command
RM	  		= Remove-Item -ErrorAction SilentlyContinue

CC_FLAGS = --std=c17

FLEX  = ../../win/win_flex.exe
BISON = ../../win/win_bison.exe

else

CC_FLAGS += -lm

endif

all: $(PROJ)

$(PROJ): rpcalc.tab.c
	$(CC) $(CC_FLAGS) $< -o $@	

rpcalc.tab.c: rpcalc.y
	$(BISON) $^

clean:
	$(RM) rpcalc.tab.c
	$(RM) $(PROJ)

.PHONY: all clean

# vim: noet
