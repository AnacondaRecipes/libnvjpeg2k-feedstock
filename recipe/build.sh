#!/bin/bash
set -exuo pipefail

# Install to conda style directories
if [[ -d lib64 ]]; then
    mv lib64 lib
fi
mkdir -p "${PREFIX}/lib"

for i in *; do
    case "$i" in
        build_env_setup.sh|conda_build.sh|metadata_conda_debug.yaml) continue ;;
    esac
    cp -rv "$i" "${PREFIX}"
done

check-glibc "$PREFIX"/lib*/*.so.* "$PREFIX"/bin/* "$PREFIX"/targets/*/lib*/*.so.* "$PREFIX"/targets/*/bin/*
