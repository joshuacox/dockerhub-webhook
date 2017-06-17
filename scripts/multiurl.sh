#!/bin/sh
echo Running multiurl script
echo $1
echo $2

if [ ! -z ${DEBUG+x} ]
  then
    echo ENV
    env
fi

if [ ! -z ${SLACK_URL+x} ]
  then
    echo "Slack URL detected sending slack"
    curl -X POST --data-urlencode \
    "payload={\"channel\": \"#github\", \"username\": \"CaptainHook\", \"text\": \"Captain Hook has detected that the ${1} container has hit the open seas.\", \"icon_emoji\": \":whale:\"}" \
    $SLACK_URL
fi

if [ ! -z ${MATTERMOST_URL+x} ]
  then
    echo "Mattermost URL detected sending matters"
    ./bokker $MATTERMOST_URL
fi

if [ ! -z ${PUSH_URLS+x} ]
  then
    echo "Push URL detected sending pushs"
    echo $PUSH_URLS|xargs -n1 -I{} ./bokker {}
fi
