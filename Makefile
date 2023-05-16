TARGETS := $(shell ls scripts)

.dapper:
	@echo Downloading dapper
	@https_proxy=10.130.0.20:7890 curl -sL https://github.com/Loongson-Cloud-Community/dapper/releases/download/v0.6.0/dapper-Linux-loong64 > .dapper.tmp
	@@chmod +x .dapper.tmp
	@mv .dapper.tmp .dapper

$(TARGETS): .dapper
	./.dapper $@

trash: .dapper
	./.dapper -m bind trash

trash-keep: .dapper
	./.dapper -m bind trash -k

deps: trash

.DEFAULT_GOAL := ci

.PHONY: $(TARGETS)
