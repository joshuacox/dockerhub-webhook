#!/bin/sh
echo Running multiurl script
echo $1
echo $2
echo $3

if [ ! -z ${DEBUG+x} ]
  then
    echo ENV
    env
fi

if [ ! -z ${SLACK_URL+x} ]
  then
    echo "Slack URL detected sending slack"
    ./bokker $SLACK_URL
fi

if [ ! -z ${MATTERMOST_URL+x} ]
  then
    echo "Mattermost URL detected sending matters"
    ./bokker $MATTERMOST_URL
fi

if [ ! -z ${PUSH_URLS+x} ]
  then
    echo "Push URL detected sending pushs"
    echo $PUSH_URLS|xargs -n1 -I{} ./bokker {} $1 $2 $3
fi
