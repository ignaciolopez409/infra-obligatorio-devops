link_develop:
	for source in $(find ../environments/develop -maxdepth 1 -mindepth 1); do ln -sf $source .;done
	@rm -rf bucket.tf

init:
	make link_develop
	terraform init -reconfigure

apply:
	terraform apply -input=false --auto-approve -var-file=config.tfvars

destroy:
	terraform destroy --auto-approve -var-file=config.tfvars

validate:
	terraform validate

all:
	make init
	make validate
	make apply
