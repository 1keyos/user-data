#!/bin/bash
terraform init
terraform get --update
terraform plan
terraform apply

