#!/bin/bash

RADEON_WHL_URL="https://repo.radeon.com/rocm/manylinux/rocm-rel-7.0/"
TRITON_REGEXP="triton_rocm-3.4.0.*cp311.*whl"
TORCH_REGEXP="torch-2.8.*rocm7.0.0.lw.*cp311.*whl" # We want "lw" for lightweight, normal torch-2.8 wont install

# - curl url to get listing of href wheel packages
# - scrape out hrefs by tr'ing " into newlines then greping whls
# - replace HTTP %2B as + char
RADEON_WHL_LISTING=`curl $RADEON_WHL_URL 2>&1 | tr '\"' '\n' | grep whl | sed 's/%2B/\+/g'`

# grep out exact package versions we want by regexp search.
TRITON_WHL_NAME=`echo $RADEON_WHL_LISTING | tr ' ' '\n' | grep $TRITON_REGEXP`
TORCH_WHL_NAME=`echo $RADEON_WHL_LISTING | tr ' ' '\n' | grep $TORCH_REGEXP`

# Install the rocm7 packages, must install Triton because rocm7 Torch requires it
pip3 install "$RADEON_WHL_URL$TRITON_WHL_NAME"
pip3 install "$RADEON_WHL_URL$TORCH_WHL_NAME"

