.PHONY: all
all:  init validate plan apply

# Executed inside the container
init:
	cd remote-docker; zip Dockerrun.zip Dockerrun.aws.json; cd .. ;
	terraform init -backend-config=backend/dev.conf -input=false #&& terraform get -update

validate:
	terraform validate -var-file=vars/dev.tfvars -check-variables=false

plan:
	terraform plan -var-file=vars/dev.tfvars -input=false -out=tfplan

apply:
	  terraform apply  -input=false tfplan
