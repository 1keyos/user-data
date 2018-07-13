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
sed -i  "s/space: local.*$/space: kube-system/g" `find ./my-olm-deployment -type f`
#- local
sed -i  "s/- local.*$/- kube-system/g" `find ./my-olm-deployment -type f`

sed -i  "s/@sha256:bd944a211eaf8f31da5e6d69e8541e7cada8f16a9f7a5a570b22478997819943/:v0.6.1/g" `find ./my-olm-deployment -type f`
sed -i  "s/@sha256:db563baa8194fcfe39d1df744ed70024b0f1f9e9b55b5923c2f3a413c44dc6b8/:v0.9.0/g" `find ./my-olm-deployment -type f`
sed -i  "s/@sha256:c0301e4686c3ed4206e370b42de5a3bd2229b9fb4906cf85f3f30650424abec2/:v0.9.2/g" `find ./my-olm-deployment -type f`
sed -i  "s/@sha256:5037b4e90dbb03ebdefaa547ddf6a1f748c8eeebeedf6b9d9f0913ad662b5731/:v0.14.0/g" `find ./my-olm-deployment -type f`
sed -i  "s/@sha256:0e92dd9b5789c4b13d53e1319d0a6375bcca4caaf0d698af61198061222a576d/:v0.15.0/g" `find ./my-olm-deployment -type f`
sed -i  "s/@sha256:945a0a6d88cf6fa2bce9a83019a2a64f74d89fc8281301a4259f3302eabc79e6/:v0.1.9/g" `find ./my-olm-deployment -type f`
sed -i  "s/@sha256:74036811bc5d6cc1a136d8cc6d5577db67f29ba95eba02fbf0c3a8d2357dc8fe/:v0.1.5/g" `find ./my-olm-deployment -type f`

grep -rh image: ./my-olm-deployment  | sort | uniq | awk '{print $2}'
sed -i  "s/quay.io\/coreos\//\$\{registry\}\/\$\{namespace\}\//g" `find ./my-olm-deployment -type f`
sed -i  "s/gcr.io\/kubernetes-helm\/.*$/\$\{registry\}\/\$\{namespace\}\/tiller:\$\{tag\}/g" `find ./my-olm-deployment -type f`
sed -i  "s/kube-system/\$\{kube_system\}/g" `find ./my-olm-deployment -type f`
mkdir -p ../../resources/addons/olm
cp ./my-olm-deployment/templates/* ../../resources/addons/olm/



