#!/bin/bash
#Script to clean buildroot configuration
#Author: Sreekanth Pasumarthy

source shared.sh

EXTERNAL_REL_BUILDROOT=../base_external
git submodule init
git submodule sync
git submodule update

set -e 
cd `dirname $0`
make -C buildroot BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT} distclean
