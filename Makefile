link:
	ln -sf ../environments/develop/bucket.tf .
	ln -sf ../environments/develop/config.tfvars .

init:
	make link
	terraform init -reconfigure

apply:
	terraform apply -input=false
