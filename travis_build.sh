#!/bin/sh -x
if [[ "${PRODUCTION}" -neq "" ]]; then
  echo PRODUCTION BUILD
fi
echo BUILDING... ${TRAVIS_OS_NAME}${BUILD}
uname -a
env | sort
#  - find / -maxdepth 2 -print -name proc -prune || true
#  - find /proc -maxdepth 2
