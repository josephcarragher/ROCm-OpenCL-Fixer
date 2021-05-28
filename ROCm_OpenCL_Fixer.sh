#!/bin/sh

# This fixes the ROCm install so OpenCL actually works.

# Needs sudo
if [ `whoami` != root ]; then
    echo Please run this script using sudo
    exit
fi

cd /
amdPath=$(find /etc/OpenCL/vendors/ -type f -name 'amdocl64*.icd')
rocmPath=$(find /opt -maxdepth 1 -type d -name 'rocm-*')

sudo echo "${rocmPath}/opencl/lib/libamdocl64.so" > ${amdPath}
echo Done
