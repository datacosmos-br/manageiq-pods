#!/bin/bash

cp ~/Downloads/VMware-vix-disklib-8.0.2-22388865.x86_64.tar.gz ./images/manageiq-base-worker/container-assets/VMware-vix-disklib-8.0.2-22388865.x86_64.tar.gz
RPM_BUILD_IMAG=docker.io/manageiq/rpm_build:latest-quinteros RPM_BUILD_OPTIONS=OPTIONS REPO=gru.ocir.io/grq1iurfepyg/manageiq TAG=240613-1 NO_OPERATOR=false NO_CACHE=false  bin/build -d . -r manageiq -b 
