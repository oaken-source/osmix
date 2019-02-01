###############################################################################
##  OSMix - an operating system for fun and teaching                          #
##                                                                            #
##  Licensed under the GPLv3. See COPYING for details.                        #
##  Copyright (C) 2019 Operating Systems & Middleware Group, HPI              #
###############################################################################

include config.mk

CC = $(TARGET)-gcc
LD = $(TARGET)-ld

.PHONY: all clean

KERNEL = osmix/kernel
LDFLAGS += -T osmix/kernel.ld

OBJ =

all: $(KERNEL)

include osmix/build.mk

$(OBJ): config.mk

$(KERNEL): $(OBJ)

clean:
	$(RM) $(KERNEL) $(OBJ)

