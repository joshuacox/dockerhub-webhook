#!/bin/sh

if [ ! -z ${DEBUG+x} ]
  then
    echo ENV
    print-env
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
    curl -X POST --data-urlencode \
    "payload={\"channel\": \"#github\", \"username\": \"CaptainHook\", \"text\": \"Captain Hook has detected that the ${1} container has hit the open seas.\", \"icon_emoji\": \":whale:\"}" \
    $MATTERMOST_URL
fi
