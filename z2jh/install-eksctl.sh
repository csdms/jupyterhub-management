#! /usr/bin/env bash
# Install `eksctl`, the AWS EKS CLI.

if [[ -z "${CONDA_PREFIX}" ]]; then
    prefix="/usr/local"
else
    prefix="${CONDA_PREFIX}"
fi

# For ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
# ARCH=amd64
os=$(uname -s)
if [[ $os == "Linux" ]]; then
    arch="amd64"
else
    arch=$(uname -m)
fi
PLATFORM=${os}_${arch}

curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

# (Optional) Verify checksum
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

sudo mv /tmp/eksctl $prefix/bin
