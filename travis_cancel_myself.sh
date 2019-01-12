#!/bin/sh

JOB=`echo $TRAVIS_JOB_WEB_URL | rev | cut -d/ -f1 | rev`

# The following wrapper prevents code tracing with `set -x` from revealling secret token
{ curl -X POST \
     -H "Travis-API-Version: 3" \
     -H "Authorization: token $UI_CONFIG_SECRET_TOKEN" \
     https://api.travis-ci.org/job/$JOB/cancel 
} 2> /dev/null
