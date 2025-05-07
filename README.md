### Scripts for configuring a Kubernetes GPU cluster.

#### 1. Install NVIDIA Driver (ubuntu 22.04)
```
$ bash install_nvidia_dirver_22_04.sh
```
Note: for other system, please refer to NVIDIA Driver installation guide.


#### 2. Install nvidia container 
```
$ bash install_nvidia_container.sh
```

#### 3. Configure a basic environment for K8s
```
$ bash basic_install_all_nodes.sh
```
Note: please configure the containerd environment following the final comment at the end in the script.


#### 4. Install K8s
##### For Master Node:
```
$ bash master_node.sh
$ bash deploy_gpu_device_plguin.sh  
```
##### For Worker Node:
```
$ bash worker_node.sh
```
check the command from Master node by
```
$ kubeadm token create --print-join-command
```

#### 5. docker-ce (Optional)
If Docker CE is required, please execute the Docker installation and configuration script only after Kubernetes has been successfully installed.
```
$ bash install_docker_ce.sh
$ bash docker_config.sh
```


### Test
```
$ kubectl apply -f test_gpu_pod.yaml
```
check the output:
```
$ kubectl logs gpu-pod
```