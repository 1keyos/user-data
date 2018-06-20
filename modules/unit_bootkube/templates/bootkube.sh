#!/bin/bash

# When self-hosted etcd is enabled, bootkube places an static pod manifest in
# /etc/kubernetes/manifests for Kubelet to boot a temporary etcd instance.
# However, Kubelet might not have started yet and therefore the folder might
# be missing for now, making bootkube crash.
mkdir -p /etc/kubernetes/manifests/

# Move network related manifests into bootkube friendly locations

# shellcheck disable=SC2154
/usr/bin/rkt run \
  --insecure-options=all \
  --volume assets,kind=host,source="/assets/" \
  --mount volume=assets,target=/assets/ \
  --volume etc-kubernetes,kind=host,source=/etc/kubernetes \
  --mount volume=etc-kubernetes,target=/etc/kubernetes \
   docker://${bootkube_image} \
  --net=host \
  --dns=host \
  --exec=/bootkube -- start --asset-dir=/assets
