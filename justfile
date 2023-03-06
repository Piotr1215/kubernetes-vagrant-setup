#!/usr/bin/env -S just --justfile
set export

# this list of available targets
default:
  @just --list --unsorted

# start kubernetes vms
start:
  @vagrant up 6a0dbdd  
  @vagrant up 58a2267  
  @vagrant up 10d1b99  

# stop kubernetes vms
stop:
  @vagrant halt 58a2267  
  @vagrant halt 10d1b99  
  @vagrant halt 6a0dbdd  

# start kubershark on all namespaces
start_kubeshark:
  @kubeshark tap -A

# stop kubeshark
stop_kubeshark:
  @kubeshark clean

# ssh to master node
ssh_kmaster:
  @ssh root@172.16.16.100

# copy fresh kube config file
copy_kube_config:
  @scp root@172.16.16.100:/etc/kubernetes/admin.conf config
