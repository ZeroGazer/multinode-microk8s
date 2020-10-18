#!/usr/bin/env bash

# create join master command
mkdir -p /vagrant/temp
for INSTANCE_ID in $(seq "$NUMBER_OF_JOINER")
do
  microk8s add-node | sed -n 2p | tee "/vagrant/temp/k8s-join-master-$INSTANCE_ID"
done

# prepare for kubeconfig setup
cat /var/snap/microk8s/current/credentials/known_tokens.csv | head -1 | cut -d "," -f1 > /vagrant/temp/kubeconfig-user-token
