wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.8.0/local_installers/cuda-repo-ubuntu2204-12-8-local_12.8.0-570.86.10-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-8-local_12.8.0-570.86.10-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-12-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-8

sudo apt-get install -y cuda-drivers

CUDA_PATH=/usr/local/cuda
CUDA_PATH_LINE="export PATH=\$CUDA_PATH/bin:\$PATH"
CUDA_LD_LIBRARY_PATH_LINE="export LD_LIBRARY_PATH=\$CUDA_PATH/lib64:\$LD_LIBRARY_PATH"
echo "CUDA_PATH=${CUDA_PATH}" >> ~/.bashrc
echo "$CUDA_PATH_LINE" >> ~/.bashrc
echo "$CUDA_LD_LIBRARY_PATH_LINE" >> ~/.bashrc
source ~/.bashrc
echo "CUDA paths have been added to .bashrc and changes have been applied."