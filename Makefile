.DEFAULT_GOAL := help
.PHONY: help files

help:
	@echo "Usage: make [TARGET]"
	@echo "Targets:"
	@echo "files                        Show files"
	@echo "s3-sync                      Admin s3 sync"

files:
	@find . -path './.git' -prune -o -ls > FILES

s3-sync:
	@aws s3 sync ./linux-amd64 s3://ncbi-blast-lib/linux-amd64
	@aws s3 sync ./linux-arm64 s3://ncbi-blast-lib/linux-arm64
