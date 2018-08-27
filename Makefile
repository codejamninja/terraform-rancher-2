CWD := $(shell pwd)

.PHONY: all
all:

.PHONY: orch
orch: orch_init
	@cd orch && terraform apply
	@cd $(CWD)

.PHONY: orch_init
orch_init: orch/.terraform

.PHONY: init
init: orch/.terraform servers/.terraform

.PHONY: clean
clean:
	-@rm -rf */.terraform */*.tfstate* */.*.tfstate* 2>/dev/null || true

orch/.terraform:
	@cd orch && terraform init
	@cd $(CWD)
