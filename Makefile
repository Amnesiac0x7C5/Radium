CC= clang
RM= rm -rf

SRC_DIR= src
BUILD_DIR= build
OBJ_DIR= $(BUILD_DIR)/obj
BIN_DIR= $(BUILD_DIR)/bin

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

SRC= $(wildcard $(SRC_DIR)/*.c)
OBJ= $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
DEP= $(OBJ:.o=.d)

TARGET= $(BIN_DIR)/radium

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

-include $(DEP)

.PHONY: all clean run