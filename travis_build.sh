#!/bin/sh -x

# 
if [ -n "${TESTFAIL}" ]; then
  echo SIMULATE FAILURE
 exit 1
fi

CPU=$(echo ${BUILD} | cut -d/ -f1)
FLAVOR=$(echo ${BUILD} | cut -d/ -f2)
ARCH=${TRAVIS_OS_NAME}${CPU}
echo BUILDING... build.${ARCH}/${FLAVOR} "<<<<<<<<<<<<<<<<<<<<<<<<"
pwd

sleep 200 # simulate opensmalltalk-vm builds
