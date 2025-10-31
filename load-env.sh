if hash nvidia-smi 2>/dev/null; then
  source `dirname $0`/nvidia-env.sh
elif hash rocm-smi 2>/dev/null; then
  source `dirname $0`/amd-env.sh
else
  echo "GPU Unsupported for triton-build-script..."
  exit 255
fi

export LLVM_INCLUDE_DIRS=$LLVM_BUILD_PATH/include
export LLVM_LIBRARY_DIR=$LLVM_BUILD_PATH/lib
export LLVM_SYSPATH=$LLVM_BUILD_PATH
export TRITON_BUILD_WITH_CLANG_LLD=1
export TRITON_BUILD_WITH_CCACHE=0
