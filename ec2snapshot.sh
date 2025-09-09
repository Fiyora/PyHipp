#!/bin/bash

ssh -o StrictHostKeyChecking=no -i ~/MyKeyPair.pem ec2-user@18.136.118.9 "source ~/.bash_profile; pcluster update-compute-fleet --status STOP_REQUESTED -n MyCluster01; ~/update_snapshot.sh data 2 MyCluster01"
