#!/bin/sh -x
uname -a
env | sort
if [[ "${PRODUCTION}" -ne "" ]]; then
  echo PRODUCTION BUILD
  sleep 5
fi
echo BUILDING... ${TRAVIS_OS_NAME}${BUILD}
sleep 5
#  - find / -maxdepth 2 -print -name proc -prune || true
#  - find /proc -maxdepth 2
