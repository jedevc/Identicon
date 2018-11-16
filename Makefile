BUILD=build
SOURCE=source

.PHONY: all
all: prebuild build

.PHONY: prebuild
prebuild:
	@mkdir -p $(BUILD)

.PHONY: build
build: $(BUILD)/java/ $(BUILD)/python/ $(BUILD)/shell/
	@echo Done.

.PHONY: clean
clean:
	@rm -rf $(BUILD)
	@echo Clean.

$(BUILD)/java/: $(SOURCE)/java/Identicon.java
	@echo Building java...

	@javac -d $(@D) $<

$(BUILD)/python/: $(SOURCE)/python/Identicon.py
	@echo Building python...

	@mkdir -p $(@D)
	@cp $< $(@D)

$(BUILD)/shell/: $(SOURCE)/shell/Identicon.sh
	@echo Building shell...

	@mkdir -p $(@D)
	@cp $< $(@D)
	@chmod u+x $@
