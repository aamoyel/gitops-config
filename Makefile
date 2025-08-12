TAG ?= 0.15.0
REPO = prometheus-operator/kube-prometheus
TMP_DIR = kube-prometheus-$(TAG)
ARCHIVE_URL = https://github.com/$(REPO)/archive/refs/tags/v$(TAG).tar.gz
OUT_DIR = manifests/monitoring/kube-prometheus/crds

.PHONY: help crds

crds: $(OUT_DIR) ## Get kube-prometheus CRDS from a github tag, ex: make crds TAG=0.15.0
	curl -sL $(ARCHIVE_URL) | tar xz -C ./
	cp -r $(TMP_DIR)/manifests/setup/* $(OUT_DIR)
	rm -rf kube-prometheus-$(TAG)
	@echo "CRDs are successfully updated !"


help: ## display available subcommands
	@echo "Usage: make <target> [VARIABLE=value]"
	@echo ""
	@echo "Available subcommands :"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
