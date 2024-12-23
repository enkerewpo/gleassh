# Makefile for gleamssh

GLSSH_SRC = glssh
GLSSHD_SRC = glsshd

all: glssh

.PHONY: glssh
glssh:
	make -C $(GLSSH_SRC)

.PHONY: clean
clean:
	rm -rf $(GLSSH_SRC)/build
	rm -rf $(GLSSHD_SRC)/build
