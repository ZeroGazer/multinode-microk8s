#!/usr/local/bin/zsh

FILE=./temp/kubeconfig-user-token
if [ ! -f "$FILE" ]; then
    echo "User token not generated."
    exit 1
fi

kubectl config set-cluster microk8s-cluster --server=https://k8s-node-0:16443 --insecure-skip-tls-verify
kubectl config set-credentials microk8s-admin --token="$(cat $FILE)"
kubectl config set-context microk8s --cluster=microk8s-cluster --namespace=default --user=microk8s-admin
