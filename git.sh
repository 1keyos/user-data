#!/bin/bash
rm -rf master_cloud-config/.terraform/
rm -rf modules/bootkube/updatesh/operator-lifecycle-manager
rm -rf modules/bootkube/updatesh/service-catalog
git add .
git commit -m "update" 
git push
