CC = clang
RM = $(if $(filter Windows_NT,$(OS)),del /Q /S,rm -rf)

SRC_DIR = src
BUILD_DIR = build
TEST_DIR = tests
OBJ_DIR = $(BUILD_DIR)/obj
BIN_DIR = $(BUILD_DIR)/bin
TEST_BUILD_DIR = $(BUILD_DIR)/test

CWARN = \
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
    -Iinc

CFLAGS = -Wall -O2 -std=c11 $(CWARN) -fno-stack-protector -fno-common -march=native -MMD -MP
LDFLAGS = -Wl,-E

SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
DEP = $(OBJ:.o=.d)

TARGET = $(BIN_DIR)/radium$(if $(filter Windows_NT,$(OS)),.exe,)

all: $(TARGET)

$(TARGET): $(OBJ)
	@mkdir -p $(BIN_DIR)
	$(CC) $(OBJ) $(LDFLAGS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

run: $(TARGET)
	@$(TARGET)

clean:
	@$(RM) $(BUILD_DIR)

test: $(SRC_DIR)
	@mkdir -p $(TEST_BUILD_DIR)
	$(CC) $(CFLAGS) $(wildcard $(TEST_DIR)/*.c) -o $(TEST_BUILD_DIR)/test_runner

-include $(DEP)

.PHONY: all clean run test