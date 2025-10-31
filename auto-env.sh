if [ "$TRITON_SCRIPT_ENV_FIRST_RUN" == "1" ]; then
  sudo dnf install python3.11-devel python3.11 ccache \
       cmake ninja-build clang llvm lld zlib zlib-devel
fi

echo "Finding the Correct Environment ..."
if [[ -v TRITON_SCRIPT_ENV ]]; then
  echo "Using User Provider Environment at $TRITON_SCRIPT_ENV ..."
  source $TRITON_SCRIPT_ENV
elif hash nvidia-smi 2>/dev/null; then
  source `dirname $0`/nvidia-env.sh
elif hash rocm-smi 2>/dev/null; then
  source `dirname $0`/amd-env.sh
else
  echo "!!! GPU Unsupported !!!"
  exit 255
fi

source `dirname $0`/common-env.sh

echo "Dumping Build Environment to env.sh ..."
echo $persistent_env > env.sh
