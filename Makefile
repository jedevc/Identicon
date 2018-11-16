BUILD=build
SOURCE=source

.PHONY: all
all: prebuild build

.PHONY: prebuild
prebuild:
	@mkdir -p $(BUILD)

DIRS=$(wildcard $(SOURCE)/*)
OUT_DIRS=$(subst $(SOURCE)/, $(BUILD)/, $(DIRS))

.PHONY: build
build: $(OUT_DIRS)
	@echo Done.

.PHONY: clean
clean:
	@rm -rf $(BUILD)
	@echo Clean.

$(BUILD)/java: $(SOURCE)/java/Identicon.java
	@echo Building java...

	@javac -d $@ $<

$(BUILD)/python: $(SOURCE)/python/Identicon.py
	@echo Building python...

	@mkdir -p $@
	@cp $< $@

$(BUILD)/shell: $(SOURCE)/shell/Identicon.sh
	@echo Building shell...

	@mkdir -p $@
	@cp $< $@
	@chmod u+x $@/Identicon.sh
