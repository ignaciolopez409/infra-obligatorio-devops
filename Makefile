link:
	ln -sf ../environments/${env}/bucket.tf .
	ln -sf ../environments/${env}/config.tfvars .

init:
	make link
	terraform init -reconfigure

apply:
	terraform apply -input=false
