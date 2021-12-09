link_develop:
	FULL_PATH=$(dirname $(pwd)) && cp -sr $FULL_PATH/environments/develop/** .
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
