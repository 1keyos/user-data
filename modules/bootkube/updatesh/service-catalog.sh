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
rm -rf  ${charttmpdir}/tmptest
mkdir -p ${charttmpdir}/tmptest
sed -i 's/requestHeaderCA:/requestHeaderCA: "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM1ekNDQWMrZ0F3SUJBZ0lCQVRBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwemRtTXQKWTJGMExXTmhNQjRYRFRFNE1EY3dNVEE0TURZME9Gb1hEVEk0TURZeU9EQTRNRFkwT0Zvd0ZURVRNQkVHQTFVRQpBeE1LYzNaakxXTmhkQzFqWVRDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTUI1ClNUS2I3ZnZoUGhraWU2V0ZxY0VaYnBKakN1eWhSMGpyanpLOUVHNSsvMENsZXZGWUlrMGVHOFl2ZVdncDVCYTYKMTMzWDVpbTV0bUpkWmNNK2cwQ3hqakJYeWJTWEhESjhxZVdtcjFpc0RiTUdIUnRSQjROc2RaR09lNkM0ZXZuTQppTDNHVXk1THI3S08vbjJZWVBibVg5dlc2OGtqZzBzaTcyVjZsME80bktSMnRWSVRpN1JRam1Jb2ZiUlBVT0xjCit5N1UwVWhsZWJORGJzRTZtay9GdVJ0K2g2d0lzSXdXR2hXaU85YmhOQm43eU51RVZUektKVDRvd3pMODkzMHQKeGE0eS9TODdFdEtlbDBqMG4yNjFnbUE3VlkyVEZrTEhZMldZZ0JoZElnWC9lT0hoa3g3YUFPNUczRDBpL3greQpHaEhmK0JMeUp5T0RNdFY5WjBFQ0F3RUFBYU5DTUVBd0RnWURWUjBQQVFIL0JBUURBZ0trTUIwR0ExVWRKUVFXCk1CUUdDQ3NHQVFVRkJ3TUJCZ2dyQmdFRkJRY0RBakFQQmdOVkhSTUJBZjhFQlRBREFRSC9NQTBHQ1NxR1NJYjMKRFFFQkN3VUFBNElCQVFCOE1ieVlLblFwZWNsMVRKalFiZTBpa3FXaTl6UXozSXNWUldsckdMVm9iVHRiM2I4NwpuUi9mVWFsaTF2ajRPK1NxR1orMGoxWFQxYUJJTDVxcCt3cXBnaXpVelczTWtoTWx0WmM5ZU1VQjl6blVrN2VYCnRqWjloNEFOZEpNdmNLVVZRcTk5ZkJ5RGtESmtNWTR2MTBEUUlBdEhJMkxqYWpYRUp4bmRjTGFGRlh3M0RVblQKMEZvN25uUU1LVkNPTXRmbDJPdGg1T1U1OTBBd3JWM2dpdmtvaGZLeFpXbys5MHlQK3NuZFJQUzh2a3A4SVZDYwoxY0dlS3YrMExhME53QTV5b3ZPamRDOVo4VE14eEFHRVFrTEErNXYvNlFkb05LWmlJMjlUWXZrQXhVaWY2N1daCi9TcEYzT1R2Z0lPcTdxVnFqWXJwT2kvdm9IUXo0ZktOekxKZQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="/g' ${values}
helm template --name catalog --namespace catalog-namespace -f ${values} ${charttmpdir} --output-dir ${charttmpdir}/tmptest
sed -i '/name: catalog-catalog-apiserver-cert/a\  namespace: ${kube_system}' ${charttmpdir}/tmptest/catalog/templates/apiregistration.yaml
sed -i '/name: "service-catalog-apiserver"/a\      namespace: ${kube_system}' ${charttmpdir}/tmptest/catalog/templates/serviceaccounts.yaml
sed -i '/name: "service-catalog-controller-manager"/a\      namespace: ${kube_system}' ${charttmpdir}/tmptest/catalog/templates/serviceaccounts.yaml

sed -i "s/- apiVersion:/- apiVersion: rbac.authorization.k8s.io\/v1/g" ${charttmpdir}/tmptest/catalog/templates/rbac.yaml
sed -i '/kind: APIService/i\apiVersion: apiregistration.k8s.io/v1beta1' ${charttmpdir}/tmptest/catalog/templates/apiregistration.yaml
sed -i '/caBundle/a\  versionPriority: 20' ${charttmpdir}/tmptest/catalog/templates/apiregistration.yaml
sed -i '/caBundle/a\  groupPriorityMinimum: 10000' ${charttmpdir}/tmptest/catalog/templates/apiregistration.yaml




sed -i '/name: catalog-catalog-apiserver/a\  namespace: ${kube_system}' ${charttmpdir}/tmptest/catalog/templates/apiserver-deployment.yaml 
sed -i '/name: catalog-catalog-apiserver/a\  namespace: ${kube_system}' ${charttmpdir}/tmptest/catalog/templates/apiserver-service.yaml 

sed -i '/name: catalog-catalog-controller-manager/a\  namespace: ${kube_system}' ${charttmpdir}/tmptest/catalog/templates/controller-manager-deployment.yaml
sed -i  "s/catalog-namespace/\$\{kube_system\}/g" `find ${charttmpdir}/tmptest -type f`
sed -i  "s/quay.io\/kubernetes-service-catalog\/.*/\$\{registry\}\/\$\{namespace\}\/service-catalog:\$\{tag\}/g"  `find ${charttmpdir}/tmptest -type f`
sed -i  "s/quay.io\/coreos\/.*/\$\{registry\}\/\$\{namespace\}\/coreos-etcd:\$\{tag\}/g" `find ${charttmpdir}/tmptest -type f`
cd ${charttmpdir}/tmptest/catalog/templates/
ls ./  | xargs -i+ mv + 00catalog_+
#grep -rh image: ./my-olm-deployment  | sort | uniq | awk '{print $2}'
cd ../../../../../
mkdir -p  ../../resources/addons/catalog/
cp ${charttmpdir}/tmptest/catalog/templates/* ../../resources/addons/catalog/



