#!/bin/bash
rm -rf modules/bootkube/updatesh/operator-lifecycle-manager
git add .
git commit -m "update" 
git push
