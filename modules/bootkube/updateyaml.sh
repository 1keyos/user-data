#!/bin/bash
#oldbootkubeversion="v0.12.0"
bootkubeversion="v0.12.0"
rm -rf `pwd`/asset/*
docker run -it -v `pwd`/asset:/asset quay.io/coreos/bootkube:${bootkubeversion} /bootkube  render   --asset-dir=/asset/flannel --cloud-provider=tempcloudprovider
docker run -it -v `pwd`/asset:/asset quay.io/coreos/bootkube:${bootkubeversion} /bootkube  render   --asset-dir=/asset/canal --network-provider experimental-canal --cloud-provider=tempcloudprovider
mkdir -p `pwd`/asset/all
cp -rf `pwd`/asset/flannel/* `pwd`/asset/all/
cp -rf `pwd`/asset/canal/* `pwd`/asset/all/
sed -i "s/https:\/\/127.0.0.1:2379/\$\{endpoints\}/g" `find ./asset/all -type f`
sed -i "s/tempcloudprovider/\$\{cloud_provider\}/g" `find ./asset/all -type f`
sed -i "s/10.2.0.0\/16/\$\{pod_cidr\}/g" `find ./asset/all -type f`
sed -i "s/10.3.0.0\/24/\$\{service_cidr\}/g" `find ./asset/all -type f`
sed -i "s/6443/\$\{api_port\}/g" `find ./asset/all -type f`
sed -i "s/cluster.local/\$\{cluster_domain_suffix\}/g" `find ./asset/all -type f`
sed -i  "s/flannel:.*$/flannel-amd64:\$\{tag\}/g" `find ./asset/all -type f`
sed -i  "s/flannel-cni:.*$/flannel-cni:\$\{tag\}/g" `find ./asset/all -type f`
sed -i  "s/\/cni:.*$/\/calico-cni:\$\{tag\}/g" `find ./asset/all -type f`
sed -i  "s/hyperkube:.*$/hyperkube:\$\{tag\}/g" `find ./asset/all -type f`
sed -i  "s/pod-checkpointer:.*$/pod-checkpointer:\$\{tag\}/g" `find ./asset/all -type f`
sed -i  "s/k8s-dns-kube-dns-amd64:.*$/k8s-dns-kube-dns-amd64:\$\{tag\}/g" `find ./asset/all -type f`
sed -i  "s/k8s-dns-dnsmasq-nanny-amd64:.*$/k8s-dns-dnsmasq-nanny-amd64:\$\{tag\}/g" `find ./asset/all -type f`
sed -i  "s/k8s-dns-sidecar-amd64:.*$/k8s-dns-sidecar-amd64:\$\{tag\}/g" `find ./asset/all -type f`
sed -i  "s/node:.*$/calico-node:\$\{tag\}/g" `find ./asset/all -type f`

sed -i  "s/quay.io\/coreos/\$\{registry\}\/\$\{namespace\}/g" `find ./asset/all -type f`
sed -i  "s/quay.io\/calico/\$\{registry\}\/\$\{namespace\}/g" `find ./asset/all -type f`
sed -i  "s/k8s.gcr.io/\$\{registry\}\/\$\{namespace\}/g" `find ./asset/all -type f`
sed -i  "s/kube-system/\$\{kube_system\}/g" `find ./asset/all -type f`
sed -i "s/\/usr\/share\/ca-certificates/\$\{trusted_certs_dir\}/g"  `find ./asset/all -type f`
sed -i  "s/apiserver.key:.*$/apiserver.key: \$\{apiserver_key\}/g" `find ./asset/all -type f`
sed -i  "s/apiserver.crt:.*$/apiserver.crt: \$\{apiserver_cert\}/g" `find ./asset/all -type f`
sed -i  "s/service-account.pub:.*$/service-account.pub: \$\{serviceaccount_pub\}/g" `find ./asset/all -type f`
sed -i  "s/ca.crt:.*$/ca.crt: \$\{ca_cert\}/g" `find ./asset/all -type f`
sed -i  "s/etcd-client-ca.crt:.*$/etcd-client-ca.crt: \$\{etcd_ca_cert\}/g" `find ./asset/all -type f`
sed -i  "s/etcd-client.crt:.*$/etcd-client.crt: \$\{etcd_client_cert\}/g" `find ./asset/all -type f`
sed -i  "s/etcd-client.key:.*$/etcd-client.key: \$\{etcd_client_key\}/g" `find ./asset/all -type f`
sed -i  "s/ca.key:.*$/ca.key: \$\{ca_key\}/g" `find ./asset/all -type f`
sed -i  "s/service-account.key:.*$/service-account.key: \$\{serviceaccount_key}/g" `find ./asset/all -type f`
sed -i  "s/certificate-authority-data:.*$/certificate-authority-data: \$\{ca_cert\}/g" `find ./asset/all -type f`
sed -i  "s/client-certificate-data:.*$/client-certificate-data: \$\{kubelet_cert\}/g" `find ./asset/all -type f`
sed -i  "s/client-key-data:.*$/client-key-data: \$\{kubelet_key\}/g" `find ./asset/all -type f`
sed -i  "s/token:.*$/token: \$\{token_id\}.\$\{token_secret\}/g" `find ./asset/all -type f`
sed -i  "s/token-id:.*$/token-id: \"\$\{token_id\}\"/g" `find ./asset/all -type f`
sed -i  "s/token-secret:.*$/token-secret: \"\$\{token_secret\}\"/g" `find ./asset/all -type f`
sed -i  "s/name: bootstrap-token-.*$/name: bootstrap-token-\$\{token_id\}/g" `find ./asset/all -type f`
sed -i  "s/https:\/\/127.0.0.1:2379/\$\{etcd_servers\}/g" `find ./asset/all -type f`

mkdir -p resources/calico
mv  asset/all/manifests/calico* resources/calico/
mkdir -p   resources/flannel/
mv  asset/all/manifests/flannel* resources/flannel/
mkdir -p resources/bootstrap-manifests/
mv asset/all/bootstrap-manifests/* resources/bootstrap-manifests/
mkdir -p resources/manifests/
mv asset/all/manifests/* resources/manifests/
mkdir -p resources/auth/
mv asset/all/auth/* resources/auth/
cp resources/auth/kubeconfig-kubelet resources/auth/nodekubeconfig-kubelet
cp resources/auth/kubeconfig resources/auth/masterkubeconfig
sed -i "s/127.0.0.1/\$\{ha_kube_ip\}/g" resources/auth/nodekubeconfig-kubelet
sed -i "s/127.0.0.1/\$\{ha_kube_ip\}/g" resources/auth/kubeconfig
















