#### Start of standard makefile configuration. ####

SHELL := /usr/bin/env bash
LN_S := ln -sf

# Root of the installation
prefix := /usr/local

exec_prefix := $(prefix)

bindir := $(exec_prefix)/bin
libdir := $(exec_prefix)/lib

# Set space as the recipe prefix, instead of tab
# Note: It also works with multiple spaces before the recipe text
empty :=
space := $(empty) $(empty)
.RECIPEPREFIX := $(space) $(space)

# Enable delete on error, which is disabled by default for legacy reasons
.DELETE_ON_ERROR:

#### End of standard makefile configuration. ####

# Project specific absolute path
srcdir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

green := \\e[32m
blue := \\e[34m
bold := \\e[1m
reset := \\e[0m

.PHONY: all
all: install

.PHONY: install
install: 
  @echo -e $(blue)Installing ...$(reset)
  @./.internal-scripts/install $(DESTDIR)$(bindir) $(DESTDIR)$(libdir)
  @echo -e $(green)Installing DONE$(reset)

.PHONY: uninstall
uninstall:
  @echo -e $(blue)Uninstalling ...$(reset)
  @./.internal-scripts/uninstall $(DESTDIR)$(bindir) $(DESTDIR)$(libdir)
  @echo -e $(green)Uninstalling DONE$(reset)

.PHONY: readme
readme:
  @echo -e $(blue)Building README.md ...$(reset)
  @./.internal-scripts/build-readme
  @echo -e $(green)Building README.md DONE$(reset)
