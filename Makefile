.PHONY : clean distclean lint test version

EMACS ?= emacs
CASK ?= cask

LOADPATH = -L .

ELPA_DIR = $(shell EMACS=$(EMACS) $(CASK) package-directory)
AUTOLOADS = $(wildcard *-autoloads.el*)
ELS = $(filter-out $(AUTOLOADS),$(wildcard *.el))
OBJECTS = $(ELS:.el=.elc)
BACKUPS = $(ELS:.el=.el~)

version: elpa
	$(CASK) exec $(EMACS) --version

lint: elpa
	$(CASK) exec $(EMACS) -Q --batch \
	    --exec "(require 'package)" \
	    --exec "(add-to-list 'package-archives '(\"melpa\" . \"https://melpa.org/packages\") t)" \
	    --exec "(package-initialize)" \
	    --exec "(require 'elisp-lint)" \
	    -f elisp-lint-files-batch \
	    $(ELS)

elpa: $(ELPA_DIR)
$(ELPA_DIR): Cask
	mkdir -p $(ELPA_DIR)/gnupg && \
	chmod 700 $(ELPA_DIR)/gnupg && \
	echo "disable-ipv6" > $(ELPA_DIR)/gnupg/dirmngr.conf && \
	for i in {1..3}; do \
	gpg --keyserver keyserver.ubuntu.com \
	    --homedir $(ELPA_DIR)/gnupg \
	    --recv-keys 066DAFCB81E42C40 \
	    && break || sleep 15; \
	done
	${CASK} install
	touch $@

clean:
	rm -rf $(OBJECTS) $(BACKUPS) $(AUTOLOADS)

distclean:
	rm -rf .cask
