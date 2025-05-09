### Scripts to Deploy a Kubernetes GPU Cluster

#### 1. Install NVIDIA Driver (for ubuntu 22.04)
```
$ bash install_nvidia_dirver_22_04.sh
```
Note: for other system, please refer to NVIDIA Driver && CUDA installation guide [CUDA Toolkit](https://developer.nvidia.com/cuda-12-8-0-download-archive?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_local).


#### 2. Install nvidia container toolkit
```
$ bash install_nvidia_container.sh
```

#### 3. Configure a basic environment for K8s
```
$ bash basic_install_all_nodes.sh
```
Note (**Important**): Please configure the `containerd` environment following `the final comment` at the end in the script `basic_install_all_nodes.sh`.


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