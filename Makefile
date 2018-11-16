BUILD=build
SOURCE=source

.PHONY: all
all: prebuild build

.PHONY: prebuild
prebuild:
	@mkdir -p $(BUILD)

.PHONY: build
build: $(BUILD)/java/Identicon.class $(BUILD)/python/Identicon.py $(BUILD)/shell/Identicon.sh
	@echo Done.

.PHONY: clean
clean:
	@rm -rf $(BUILD)
	@echo Clean.

$(BUILD)/%/Identicon.class: $(SOURCE)/%/Identicon.java
	@echo Building java...

	@javac -d $(@D) $<

$(BUILD)/%/Identicon.py: $(SOURCE)/%/Identicon.py
	@echo Building python...

	@mkdir -p $(@D)
	@cp $< $(@D)

$(BUILD)/%/Identicon.sh: $(SOURCE)/%/Identicon.sh
	@echo Building shell...

	@mkdir -p $(@D)
	@cp $< $(@D)
	@chmod u+x $@
