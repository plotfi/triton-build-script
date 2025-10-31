#!/bin/bash

# First time users run:
# TRITON_SCRIPT_ENV_FIRST_RUN=1 \
# bash ~/fbsource/fbcode/scripts/plotfi/triton-build-script/triton-build-script-ng.sh

source `dirname $0`/auto-env.sh

echo "⚛ Attempting to Clone Triton from $TRITON_URL ..."
if [ ! -d triton ]; then git clone $TRITON_URL $PROJECT_DIR; fi

echo "🐍🔥 Setting Up VENV ($VENV_PROJECT_NAME), Installing PyTorch Nightly ($TORCH_URL), Removing pytorch-triton ..."
python3.11 -m venv $PROJECT_DIR/.venv --prompt $VENV_PROJECT_NAME
source $PROJECT_DIR/.venv/bin/activate
pip install --no-cache-dir --pre torch torchvision torchaudio --index-url $TORCH_URL
pip uninstall -y pytorch-triton pytorch-triton-rocm

echo "🐲 Building+Installing Triton+Requirements+LLVM ..."
make -C $PROJECT_DIR dev-install-llvm

echo "Now Please Run:"
echo "source env.sh # run just once"
echo "DEBUG=$DEBUG python -m pip install -e $PROJECT_DIR --no-build-isolation"
