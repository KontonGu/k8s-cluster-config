sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --cri-socket unix:///var/run/containerd/containerd.sock

mkdir -p $HOME/.kube
## [konton]: if you don't have the sudo permssion to copy the config file under /etc/kubernetes, execute followng command
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml --kubeconfig=$HOME/.kube/config

kubectl taint node `hostname` node-role.kubernetes.io/control-plane:NoSchedule-
kubectl taint node `hostname` node-role.kubernetes.io/master:NoSchedule-
kubectl label node `hostname` node-role.kubernetes.io/master=true