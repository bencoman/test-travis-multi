#!/bin/sh -x
env

# FILTER OUT COVERAGE CROSSTAB DUPLICATES OF PRODUCTION JOBS
PRODUCTION_PARAMS="stage:Production,os:${TRAVIS_OS_NAME},env:BUILD=${BUILD}"
echo Production jobs...
cat .travis.yml | tr -d '"[:blank:]' | grep stage:Production
echo Current parameters... 
echo "{stage:${TRAVIS_BUILD_STAGE_NAME},os:${TRAVIS_OS_NAME},env:BUILD=${BUILD}}"
echo Check for matching... 
echo "${PRODUCTION_PARAMS}"
echo Found...
if [ "$TRAVIS_BUILD_STAGE_NAME" = "Production" ]; then
  echo PRODUCTION JOB - CONTINUE.
  sleep 1 && exit 1
else
  # If there is a matching job defined in the Production stage...
  if cat .travis.yml | tr -d '"[:blank:]' | grep ${PRODUCTION_PARAMS}; then
    echo DUPLICATE OF PRODUCTION JOB - SKIP!!!
    sleep 1 && exit 0
  else
    echo UNIQUE JOB - CONTINUE.
    sleep 1 && exit 1 
  fi
fi

