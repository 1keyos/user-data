#!/bin/bash
export all_proxy=115.126.86.49:808
export https_proxy=115.126.86.49:808
echo `dirname $0`

cd `dirname $0`
terraform init
terraform get --update
terraform plan
echo "yes" | terraform apply
