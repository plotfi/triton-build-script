# Edit environment files based on nightlies at https://pytorch.org/get-started/locally

echo "Loading Nvidia 🟩 Environment..."
export CUDA_OR_ROCM=cu
export CUDA_MAJOR=12
export CUDA_MINOR=6
export PATH=$CUDA_HOME/bin:$PATH
export USE_CUDA=1
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
export CUDA_NVCC_EXECUTABLE=$CUDA_HOME/bin/nvcc
