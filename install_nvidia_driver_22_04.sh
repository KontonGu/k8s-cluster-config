sudo apt-get update
sudo apt-get install -y nvidia-driver-570

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-6


CUDA_PATH=/usr/local/cuda
CUDA_PATH_LINE="export PATH=\$CUDA_PATH/bin:\$PATH"
CUDA_LD_LIBRARY_PATH_LINE="export LD_LIBRARY_PATH=\$CUDA_PATH/lib64:\$LD_LIBRARY_PATH"
echo "CUDA_PATH=${CUDA_PATH}" >> ~/.bashrc
echo "$CUDA_PATH_LINE" >> ~/.bashrc
echo "$CUDA_LD_LIBRARY_PATH_LINE" >> ~/.bashrc
source ~/.bashrc
echo "CUDA paths have been added to .bashrc and changes have been applied."