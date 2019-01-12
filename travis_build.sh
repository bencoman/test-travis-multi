#!/bin/sh -x
uname -a
env | sort

# 
if [ -n "${TESTFAIL}" ]; then
  echo SIMULATE FAILURE
 exit 1
fi

echo Current build parameters... "stage:${TRAVIS_BUILD_STAGE_NAME},os:${TRAVIS_OS_NAME},env:BUILD=${BUILD}"
PRODUCTION_PARAMS="stage:Production,os:${TRAVIS_OS_NAME},env:BUILD=${BUILD}"
echo Check for matching build... "${PRODUCTION_PARAMS}"
echo Found...
# If there is a matching job defined in the Production stage...
if cat .travis.yml | tr -d '"[:blank:]' | grep ${PRODUCTION_PARAMS}; then
  # and we are not in the Production stage...
  if [ "$TRAVIS_BUILD_STAGE_NAME" != "Production" ]; then
    # don't don't build again.
    echo ALREADY BUILT BY PRODUCTION STAGE, SKIPPING...
    exit 1
  fi
else
  echo nothing... no matching production build
fi

CPU=$(echo ${BUILD} | cut -d/ -f1)
FLAVOR=$(echo ${BUILD} | cut -d/ -f2)
ARCH=${TRAVIS_OS_NAME}${CPU}
which travis
echo BUILDING... build.${ARCH}/${FLAVOR}
pwd
gem install travis
find / -name travis 2>/dev/null
exit 1


# PLACEHOLDER BUILD
#find /home -maxdepth 4
#find / -maxdepth 2 -print -name proc -prune -o -name dev -prune -o -name Volume -prune || true
#if find /proc -maxdepth 2 ; then
#   echo DONE
#fi

