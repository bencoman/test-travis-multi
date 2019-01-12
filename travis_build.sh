#!/bin/sh -x
uname -a
env | sort

# 
if [ -n "${TESTFAIL}" ]; then
  echo SIMULATE FAILURE
 exit 1
fi

./travis_cancel_dup_prod_job.sh -x

CPU=$(echo ${BUILD} | cut -d/ -f1)
FLAVOR=$(echo ${BUILD} | cut -d/ -f2)
ARCH=${TRAVIS_OS_NAME}${CPU}
echo BUILDING... build.${ARCH}/${FLAVOR} "<<<<<<<<<<<<<<<<<<<<<<<<"
pwd

# Temporary for testing - job to remain alive 
sleep 10
