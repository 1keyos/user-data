#!/bin/bash
version="master-251aa80a"
if [ ! -d "./operator-lifecycle-manager" ]; then
git clone https://github.com/operator-framework/operator-lifecycle-manager
cd operator-lifecycle-manager
else
cd operator-lifecycle-manager
git checkout .
git pull
fi
#rm ./deploy/chart/catalog_resources/ocs/etcdoperator.clusterserviceversion.yaml
#rm ./deploy/chart/catalog_resources/ocs/etcdoperator.v0.9.0.clusterserviceversion.yaml
#rm ./deploy/chart/catalog_resources/ocs/vaultoperator.clusterserviceversion.yaml
#rm ./deploy/chart/catalog_resources/ocs/prometheusoperator.0.14.0.clusterserviceversion.yaml

cp ../my-values.yaml ./
sed -i "s/:local/:${version}/g" my-values.yaml
./scripts/package-release.sh 1.0.0-myolm ./my-olm-deployment my-values.yaml
grep -rh image: ./my-olm-deployment  | sort | uniq | awk '{print $2}'
sed -i  "s/quay.io\/coreos\//\$\{registry\}\/\$\{namespace\}\//g" `find ./my-olm-deployment -type f`
sed -i  "s/gcr.io\/kubernetes-helm\/.*$/\$\{registry\}\/\$\{namespace\}\/tiller:\$\{tag\}/g" `find ./my-olm-deployment -type f`
sed -i  "s/namespace: local.*$/namespace: \$\{kube_system\}/g" `find ./my-olm-deployment -type f`
mkdir -p ../../resources/addons/olm
cp ./my-olm-deployment/templates/* ../../resources/addons/olm/



