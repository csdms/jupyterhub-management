#! /usr/bin/env bash
# Install `kubectl` for managing Kubernetes clusters.

if [[ -z "${CONDA_PREFIX}" ]]; then
    PREFIX="/usr/local"
else
    PREFIX="${CONDA_PREFIX}"
fi

OS=$(uname -s | tr "[:upper:]" "[:lower:]")
ARCH=$(uname -m)
if [[ $ARCH == "x86_64" ]]; then
    ARCH="amd64"
fi

curl -sLo kubectl https://dl.k8s.io/release/$(curl -s -L https://dl.k8s.io/release/stable.txt)/bin/$OS/$ARCH/kubectl

chmod +x ./kubectl
mv -i ./kubectl $PREFIX/bin
