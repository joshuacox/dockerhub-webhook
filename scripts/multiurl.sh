#!/bin/sh
echo Running multiurl script

if [ ! -z ${DEBUG+x} ]
  then
    echo ENV
    env
    echo $1
    echo $2
    echo $3
fi

if [ ! -z ${SLACK_URL+x} ]
  then
    echo "Slack URL detected sending slack"
    /src/scripts/bokker $SLACK_URL $1 $2 $3
fi

if [ ! -z ${MATTERMOST_URL+x} ]
  then
    echo "Mattermost URL detected sending matters"
    /src/scripts/bokker $MATTERMOST_URL $1 $2 $3
fi

if [ ! -z ${PUSH_URLS+x} ]
  then
    echo "Push URL detected sending pushs"
    echo $PUSH_URLS|xargs -n1 -I{} /src/scripts/bokker {} $1 $2 $3
fi
