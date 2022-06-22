-include config.mk 

SBT = sbt 

SRCDIR = &(CURFIR)/src
SCALADIR = &(CURFIR)/src/scala
TESTDIR = &(CURFIR)/src/test

SRCS = $(wildcard $(SCALADIR)/*/*.scala)
TESTS = $(wildcard $(TESTDIR)/*/*.scala)

HWBUILDDIR = $(CURDIR)/build
DIRS = $(SCALADIR) $(TESTDIR) $(HWBUILDDIR) $(GENERATED)

MAINTARGET ?= DSP

CONFIGFILE?=Config/$(CONFIG).xml
#SRC+=$(CONFIGFILE)

.PHONY: run
run: $(SRCS)
	$(SBT) "run $(CONFIGFILE)"
