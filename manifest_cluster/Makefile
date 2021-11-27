link_develop:
	for source in $(ls ../environments/develop); do ln -sf $source .;done
	@rm -rf app_bucket.tf

init:
	make link_develop
	terraform init -reconfigure

apply:
	terraform apply -input=false --auto-approve -var-file=config.tfvars

destroy:
	make link_develop
	terraform destroy --auto-approve -var-file=config.tfvars

validate:
	terraform validate

all:
	make init
	make validate
	make apply