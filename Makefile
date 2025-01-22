# A GNU Makefile to run various tasks - compatibility for us old-timers.

# Note: This makefile include remake-style target comments.
# These comments before the targets start with #:
# remake --tasks to shows the targets and the comments

GIT2CL ?= admin-tools/git2cl
PYTHON ?= python3
PIP ?= pip3
RM  ?= rm
LANG = en

.PHONY: all \
   develop dist doc doc-data \
   pytest \
   rmChangeLog \
   test

#: Default target - same as "develop"
all: install

#: Install mathics
install:
	$(PYTHON) setup.py install

#: Remove ChangeLog
rmChangeLog:
	$(RM) ChangeLog || true

#: Create a ChangeLog from git via git log and git2cl
ChangeLog: rmChangeLog
	git log --pretty --numstat --summary | $(GIT2CL) >$@

sdist:
	$(PYTHON) ./setup.py sdist
