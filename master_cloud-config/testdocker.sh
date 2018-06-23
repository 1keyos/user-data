#!/bin/bash
echo `dirname $0`

cd `dirname $0`
terraform init
terraform get --update
terraform plan --var-file=dockerterraform.tfvars 
echo yes | terraform apply --var-file=dockerterraform.tfvars 
