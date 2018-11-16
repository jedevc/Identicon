BUILD=build
SOURCE=source

.PHONY: all
all: prebuild build

.PHONY: prebuild
prebuild:
	@mkdir -p $(BUILD)

.PHONY: build
build: $(BUILD)/Identicon.class $(BUILD)/Identicon.py $(BUILD)/Identicon.sh
	@echo Done.

.PHONY: clean
clean:
	@rm -rf $(BUILD)
	@echo Clean.

$(BUILD)/Identicon.class: $(SOURCE)/Identicon.java
	@echo Building java...

	@javac -d $(BUILD) $(SOURCE)/Identicon.java

$(BUILD)/Identicon.py: $(SOURCE)/Identicon.py
	@echo Building python...

	@cp $(SOURCE)/Identicon.py $(BUILD)/Identicon.py

$(BUILD)/Identicon.sh: $(SOURCE)/Identicon.sh
	@echo Building shell...

	@cp $(SOURCE)/Identicon.sh $(BUILD)/Identicon.sh
	@chmod u+x $(BUILD)/Identicon.sh
