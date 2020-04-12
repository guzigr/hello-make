# make -f hello_make.mk build EXE=hello OBJS=hello.o
CC=gcc
CFLAGS=-W -Wall
MAKE=make
MAKEFILE=hello_make.mk
PROCDEMO=hello
REMOVE=rm -rf
CLNCACHE=cleancache
C2O=$(CC) $(CFLAGS) -c $*.c
BUILD=$(CC) -o $(EXE) $(OBJS)

#-----------------------------------------------------------------------------
# Targets
all: clean $(PROCDEMO)

$(PROCDEMO):
	$(MAKE) -f $(MAKEFILE) build OBJS=$@.o EXE=$@

build: $(CLNCACHE) $(OBJS)
	$(BUILD)

#-----------------------------------------------------------------------------
# Here are some rules for converting .pc -> .c -> .o
.SUFFIXES: .pc .c .o

.pc.c:
	$(MAKE) -f $(MAKEFILE)

.c.o:
	$(C2O)

clean: $(CLNCACHE)
	$(REMOVE) $(PROCDEMO) $(PROCDEMO).o $(PROCDEMO).c $(PROCDEMO).lis

cleancache:
	$(REMOVE) $(CACHEDIR)
