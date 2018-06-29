#!/bin/bash
version="master-251aa80a"
if [ ! -d "./service-catalog" ]; then
git clone https://github.com/kubernetes-incubator/service-catalog
cd service-catalog
else
cd service-catalog
git checkout .
git pull
fi
#rm ./deploy/chart/catalog_resources/ocs/etcdoperator.clusterserviceversion.yaml
#rm ./deploy/chart/catalog_resources/ocs/etcdoperator.v0.9.0.clusterserviceversion.yaml
#rm ./deploy/chart/catalog_resources/ocs/vaultoperator.clusterserviceversion.yaml
#rm ./deploy/chart/catalog_resources/ocs/prometheusoperator.0.14.0.clusterserviceversion.yaml
charttmpdir="`pwd`/charts/catalog"
values=${charttmpdir}/values.yaml
mkdir -p ${charttmpdir}/tmptest
helm template --name catalog --namespace catalog-namespace -f ${values} ${charttmpdir} --output-dir ${charttmpdir}/tmptest
sed -i  "s/catalog-namespace/\$\{kube-system\}/g" `find ${charttmpdir}/tmptest -type f`
sed -i  "s/quay.io\/kubernetes-service-catalog\//\$\{registry\}\/\$\{namespace\}\/service-catalog:\$\{tag\}/g"  `find ${charttmpdir}/tmptest -type f`
sed -i  "s/quay.io\/coreos\//\$\{registry\}\/\$\{namespace\}\/etcd:\$\{tag\}/g" `find ${charttmpdir}/tmptest -type f`

#grep -rh image: ./my-olm-deployment  | sort | uniq | awk '{print $2}'
mkdir -p  ../../resources/addons/catalog/
cp ${charttmpdir}/tmptest/catalog/templates/* ../../resources/addons/catalog/



