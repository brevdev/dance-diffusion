#!/bin/bash

# set -eo pipefail
set -eo pipefail
conda init zsh
conda init bash 
eval "$(conda shell.bash hook)"
pip install .
conda install -n base ipykernel --update-deps --force-reinstall -y
git clone https://github.com/harmonai-org/sample-generator
git clone --recursive https://github.com/crowsonkb/v-diffusion-pytorch
pip install ./sample-generator
pip install ./v-diffusion-pytorch
pip install ipywidgets==7.7.1 gradio
pip install k-diffusion