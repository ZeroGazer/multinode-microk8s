#!/usr/bin/env bash

# install microk8s
snap install microk8s --classic

# check status
microk8s status --wait-ready

# enable features
microk8s enable dashboard dns helm3

# setup kubectl alias
snap alias microk8s.kubectl kubectl

# setup permission to access microk8s
usermod -a -G microk8s vagrant
chown -f -R vagrant ~/.kube
