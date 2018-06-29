#!/bin/bash
rm -rf modules/bootkube/updatesh/operator-lifecycle-manager
rm -rf modules/bootkube/updatesh/service-catalog
git add .
git commit -m "update" 
git push
