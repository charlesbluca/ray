#!/bin/bash

set -ex

git config --global core.symlinks true
git config --global core.autocrlf false
mkdir -p /c/rayci
git clone . /c/rayci
cd /c/rayci

pip install -v -e python
pip wheel -e python -w .whl

# Clean up temp files to speed up docker build
pip cache purge
powershell ci/ray_ci/windows/cleanup.ps1
