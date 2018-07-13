#!/bin/bash
terraform init
terraform get --update
terraform plan
echo yes | terraform apply

