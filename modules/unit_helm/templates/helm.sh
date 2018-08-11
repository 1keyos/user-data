#!/bin/bash
set -e

exec /usr/bin/rkt run \
          --volume hostopt,kind=host,source=/opt/bin/  --mount volume=hostopt,target=/host/opt/bin/ \
          --volume hostterraform,kind=host,source=${asset_dir}/terraform.tfvars  --mount volume=hostterraform,target=/user-data/master_cloud-config/myterraform.tfvars \
          --volume home,kind=host,source=${asset_dir}/ --mount volume=home,target=${asset_dir} \
          --volume kubernetes,kind=host,source=/etc/kubernetes --mount volume=kubernetes,target=/etc/kubernetes \
          --volume imagesconf,kind=host,source=/etc/harbor/ --mount volume=imagesconf,target=/etc/harbor/ \
          --insecure-options=all  --net=host docker://${IMAGE} \
          --exec /start.sh 

