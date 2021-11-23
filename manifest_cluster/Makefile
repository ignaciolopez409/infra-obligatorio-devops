link_develop:
	ln -sf ../environments/develop/bucket.tf .
	ln -sf ../environments/develop/config.tfvars .

init:
	make link_develop
	terraform init -reconfigure

apply:
	terraform apply -input=false --auto-approve -var-file=config.tfvars

destroy:
	terraform destroy --auto-approve -var-file=config.tfvars
	rm -rf bucket.tf config.tfvars
