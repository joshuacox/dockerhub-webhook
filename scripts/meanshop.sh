#!/bin/sh
echo Running dummy script
echo $1
echo $2

if [ ! -z ${DEBUG+x} ]
  then
    echo ENV
    print-env
fi

if [ ! -z ${SLACK_URL+x} ]
  then
    echo "Slack URL detected sending slack"
    curl -X POST --data-urlencode \
    'payload={"channel": "#github", "username": "webhookbot", "text": "Captain Hook has detected that the meanshop webhook has been triggered.", "icon_emoji": ":whale:"}' \
    $SLACK_URL
fi
