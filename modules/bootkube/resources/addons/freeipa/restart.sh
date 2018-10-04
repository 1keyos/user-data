#!/bin/bash
kubectl --kubeconfig=/etc/kubernetes/kubeconfig-admin delete  -f ./

kubectl --kubeconfig=/etc/kubernetes/kubeconfig-admin apply -f ./
