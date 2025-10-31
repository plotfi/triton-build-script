# Edit environment files based on nightlies at https://pytorch.org/get-started/locally



export TORCH_URL=https://download.pytorch.org/whl/nightly/$CUDA_OR_ROCM$CUDA_MAJOR$CUDA_MINOR
export TRITON_URL=https://github.com/triton-lang/triton
export DEBUG=1
export VENV_PROJECT_NAME=triton
export PROJECT_DIR=`pwd`/$VENV_PROJECT_NAME
export LLVM_BUILD_TYPE=RelWithDebInfo
export LLVM_BUILD_PATH=$PROJECT_DIR/llvm-project/build

if [[ -v TRITON_SCRIPT_BUILD_FLAVOR ]]; then
  export LLVM_BUILD_TYPE=$TRITON_SCRIPT_BUILD_FLAVOR
fi
if [ "$LLVM_BUILD_TYPE" != "Debug" ]; then
  export DEBUG=0
fi

persistent_env="export TRITON_BUILD_WITH_CLANG_LLD=1; \
                export TRITON_BUILD_WITH_CCACHE=0; \
                export PROJECT_DIR=$PROJECT_DIR; \
                export LLVM_BUILD_PATH=$LLVM_BUILD_PATH; \
                export LLVM_INCLUDE_DIRS=$LLVM_BUILD_PATH/include; \
                export LLVM_LIBRARY_DIR=$LLVM_BUILD_PATH/lib; \
                export LLVM_SYSPATH=$LLVM_BUILD_PATH; \
                source $PROJECT_DIR/.venv/bin/activate"

