CC= clang
FLEX= flex
BISON= bison
RM= rm -rf

SRC_DIR= src
BUILD_DIR= build
TEST_DIR= tests
OBJ_DIR= $(BUILD_DIR)/obj
BIN_DIR= $(BUILD_DIR)/bin
TEST_BUILD_DIR= $(BUILD_DIR)/test

CWARN= \
    -Wfatal-errors \
    -Wextra \
    -Wshadow \
    -Wundef \
    -Wwrite-strings \
    -Wredundant-decls \
    -Wdisabled-optimization \
    -Wdouble-promotion \
    -Wmissing-declarations \
    -Wconversion \
    -Wuninitialized \
    -Wstrict-overflow=2 \
    -Wdeclaration-after-statement \
    -Wmissing-prototypes \
    -Wnested-externs \
    -Wstrict-prototypes \
    -Wc++-compat \
    -Wold-style-definition \

CFLAGS= -Wall -O2 -std=c17 $(CWARN) -fno-stack-protector -fno-common -march=native -MMD -MP
LDFLAGS= -Wl,-E

SRC= $(wildcard $(SRC_DIR)/*.c)
DEP= $(OBJ:.o=.d)

LEX_SRC= $(SRC_DIR)/lexer.l
YACC_SRC= $(SRC_DIR)/parser.y
LEX_OBJ= $(BUILD_DIR)/lex.yy.c
YACC_OBJ= $(BUILD_DIR)/parser.tab.c
YACC_HEADER= $(BUILD_DIR)/parser.tab.h

TARGET= $(BIN_DIR)/radium


all: $(TARGET)

$(TARGET): $(OBJ) $(LEX_OBJ) $(YACC_OBJ)
	@mkdir -p $(BIN_DIR)
	$(CC) $(LEX_OBJ) $(YACC_OBJ) -o $@ $(LDFLAGS)

$(LEX_OBJ): $(LEX_SRC)
	@mkdir -p $(BUILD_DIR)
	$(FLEX) -o $(LEX_OBJ) $(LEX_SRC)

$(YACC_OBJ) $(YACC_HEADER): $(YACC_SRC)
	@mkdir -p $(BUILD_DIR)
	$(BISON) -d -o $(YACC_OBJ) $(YACC_SRC)

run: $(TARGET)
	@$(TARGET)

clean:
	@$(RM) $(BUILD_DIR)

.PHONY: all clean run