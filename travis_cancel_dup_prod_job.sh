#!/bin/sh

# FILTER OUT COVERAGE CROSSTAB DUPLICATES OF PRODUCTION JOBS
PRODUCTION_PARAMS="stage:Production,os:${TRAVIS_OS_NAME},env:BUILD=${BUILD}"
echo Production jobs...
cat .travis.yml | tr -d '"[:blank:]' | grep stage:Production
echo Current parameters... "stage:${TRAVIS_BUILD_STAGE_NAME},os:${TRAVIS_OS_NAME},env:BUILD=${BUILD}"
echo Check for matching... "${PRODUCTION_PARAMS}"
echo -n Found................
# If there is a matching job defined in the Production stage...
if cat .travis.yml | tr -d '"[:blank:]' | grep ${PRODUCTION_PARAMS}; then
  # and we are not in the Production stage...
  if [ "$TRAVIS_BUILD_STAGE_NAME" != "Production" ]; then
    # don't don't build again.
    echo DUPLICATE OF PRODUCTION JOB, CANCELLING!!!
    ./travis_cancel_myself.sh
    sleep 60 # wait for cancel
  fi
else
  echo no match
fi

