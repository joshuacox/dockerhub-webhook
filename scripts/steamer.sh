#!/bin/sh
echo Running Steamer script
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
    'payload={"channel": "#github", "username": "CaptainHook", "text": "Captain Hook has detected that the steamer container has hit the open seas.", "icon_emoji": ":whale:"}' \
    $SLACK_URL
fi
