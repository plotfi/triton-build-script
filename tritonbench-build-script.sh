#!/bin/bash

git clone https://github.com/meta-pytorch/tritonbench.git
cd tritonbench
git submodule update --init --recursive

pip install -r requirements.txt  
