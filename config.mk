
TARGET = arm-none-eabi

CFLAGS ?= -Wall -Wextra -g
CFLAGS += -fno-common -ffreestanding -nostdlib -Wall -Wextra

LDFLAGS += -fno-common -ffreestanding -nostdlib
