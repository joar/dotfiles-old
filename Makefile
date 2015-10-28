PAIRS := $(shell ./bin/get-files both | while read line; do echo $$line | sed 's/ /+/g'; done)
INSTALL_FILES := $(shell ./bin/get-files install)
COLLECT_FILES := $(shell ./bin/get-files collect)

define INSTALL_TEMPLATE
$(eval FIRST = $(word 1,$(1)))
$(eval SECOND = $(word 2,$(1)))

$(SECOND): $(FIRST)
	cp $$^ $$@
endef

define COLLECT_TEMPLATE
$(eval FIRST = $(word 1,$(1)))
$(eval SECOND = $(word 2,$(1)))

$(FIRST): $(SECOND)
	cp $$^ $$@
endef

$(foreach PAIR,$(PAIRS),$(eval $(call COLLECT_TEMPLATE,$(subst +, ,$(PAIR)))))
$(foreach PAIR,$(PAIRS),$(eval $(call INSTALL_TEMPLATE,$(subst +, ,$(PAIR)))))

.PHONY: collect
collect: $(COLLECT_FILES)

.PHONY: install
install: $(INSTALL_FILES)

.PHONY: clean
clean:
	@echo $(COLLECT_FILES)
