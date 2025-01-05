# Radium Makefile

PROJ = radium

CC       = clang
CC_FLAGS = --std=c17 --include=./src/radium_linux.h
CC_REL   = -O2
CC_DBG   = -O0 -Wall -g

FLEX  = flex
BISON = bison
RM    = rm

ifeq ($(OS), Windows_NT)

SHELL = pwsh.exe
.SHELLFLAGS = -noprofile -command

PROJ = radium.exe

CC_FLAGS = --std=c17 -DYY_NO_UNISTD_H --include=./src/radium_win.h

FLEX  = win/win_flex.exe
BISON = win/win_bison.exe

RM	  = Remove-Item -ErrorAction SilentlyContinue

endif

SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin


SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(SRC:.c=.o)

all: bin/$(PROJ)




.PHONY: all clean

# vim: noet
