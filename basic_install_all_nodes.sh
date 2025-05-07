## Disable the swap
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab


cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
# net.ipv4.ip_forward = 1
# net.bridge.bridge-nf-call-ip6tables = 1
# net.bridge.bridge-nf-call-iptables = 1
# EOF
# sudo sysctl --system

cat <<EOF | sudo tee /etc/sysctl.d/kubernetes.conf
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system

#close firewall
sudo systemctl stop ufw
sudo systemctl disable ufw


# Installing Docker
sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

sudo apt-get update 
# sudo apt-get install -y docker-ce=5:19.03.14~3-0~ubuntu-bionic \
# docker-ce-cli=5:19.03.14~3-0~ubuntu-bionic containerd.io containernetworking-plugins
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update


VERSION_STRING=5:27.5.1-1~ubuntu.22.04~jammy
sudo apt-get install -y docker-ce-cli=$VERSION_STRING containerd.io containernetworking-plugins

## change to the root user with
# sudo su -
# containerd config default>/etc/containerd/config.toml
# exit

## edit the file /etc/containerd/config.toml and set the following parameters
## 1.
## SystemdCgroup = true
## 2. 
## [plugins."io.containerd.grpc.v1.cri".containerd]
##      default_runtime_name = "nvidia"
## Then:
## sudo systemctl restart containerd
## sudo nvidia-ctk runtime configure --runtime containerd --config /etc/containerd/config.toml 
## sudo systemctl restart containerd