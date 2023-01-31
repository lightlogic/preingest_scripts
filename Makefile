#!/usr/bin/env make -f

# Bash AVpres Makefile generated on 2023-01-31 at 08:23:33 UTC
#
# Copyright (c) 1991-2023 by Reto Kromer <https://reto.ch>
#
# This make script is released under a 3-Clause BSD License and is provided
# "as is" without warranty or support of any kind.

PREFIX := /usr/local
BINPREFIX := /usr/local/bin
MANPREFIX := /usr/local/share/man/man1
SHELL ?= /bin/sh
RELEASE := $(shell cat VERSION)
BIN := $(wildcard bin/*)
MAN := $(wildcard man/*)
UNAME_S := $(shell uname -s)
UNAME_M := $(shell uname -m)
UNAME_P := $(shell uname -p)

.PHONY: install uninstall info

install: $(BIN) $(MAN)
	@echo "Installing..."
	for i in $(BIN); do cp $$i $(BINPREFIX); done
	for j in $(MAN); do cp $$j $(MANPREFIX); done

uninstall: $(BIN) $(MAN)
	@echo "Uninstalling..."
	for i in $(BIN:bin/%=%); do rm $(BINPREFIX)/$$i; done
	for j in $(MAN:man/%=%); do rm $(MANPREFIX)/$$j; done

info:
	@echo
	@echo "  This Makefile installs or uninstalls"
	@echo "    Bash AVpres"
	@echo "    version $(RELEASE)"
	@echo "    for $(UNAME_S) on $(UNAME_M) with $(UNAME_P)"
	@echo "  Reto Kromer"
	@echo
