# multinode-microk8s

This repository illustrates how to set up a set of virtual machines with microk8s in a local machine to form a multi-node kubernetes cluster with HA support for development or testing.

1. Use vagrant to setup multiple virtual machines, at least 3 virtual machines are required to support high availability
2. Use Parallels Desktop Pro as VM provider
3. Use ansible to provision setup
4. Use microk8s to setup kubernetes

## Run

```shell script
# start up
vagrant up --no-parallel
# parallelism is disabled as order of provision matters

# suspend
vagrant suspend

# resume after suspend
vagrant resume

# delete vm
vagrant destroy --force
```

## Setup kube config
```shell script
# Run after cluster setup
./setup-kubeconfig.sh
```

## Tools and Environment

* MacOS Catalina
* Ansible 2.9.11
* Parallels Desktop Pro 16.0.1
* Vagrant 2.2.10
