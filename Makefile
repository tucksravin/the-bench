# the-bench — thin delegator.
#
# Every project under projects/ is self-contained: its own Makefile, .venv and
# requirements.txt. This file forwards to them and owns nothing else.
#
#   make test                     -> make -C projects/octagonal-led-turn-counter test
#   make PROJ=<name> test         -> same, for another project
#   make -C projects/<name> test  -> the explicit form; always works
#
# Uses $(MAKE) -C, never `make -f`. With -f, make would expand the project's
# recipes but run them with cwd HERE, where .venv/ and tests/ do not exist —
# breaking every target at once while looking correct under `make -n`.

PROJ ?= octagonal-led-turn-counter

.PHONY: help projects

help: ## this message
	@echo "the-bench — workshop monorepo"
	@echo ""
	@echo "  make projects              list bench projects"
	@echo "  make <target>              run <target> in $(PROJ)"
	@echo "  make PROJ=<name> <target>  run <target> in another project"
	@echo ""
	@echo "Per-project targets:  make -C projects/$(PROJ) help"

projects: ## list bench projects
	@ls -1 projects/

# Forward anything else to the project's own Makefile.
%:
	@$(MAKE) -C projects/$(PROJ) $@
