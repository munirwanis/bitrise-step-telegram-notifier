#!/bin/bash
set -ex

# echo "This is the value specified for the input 'example_step_input': ${example_step_input}"
if [ ! -z "$TELEGRAM_FAILURE_MESSAGE" ] ; then
	MESSAGE="$TELEGRAM_FAILURE_MESSAGE"
else
  MESSAGE="🛑 *$BITRISE_APP_TITLE*: build $BITRISE_BUILD_NUMBER failed 💔 \nURL: $BITRISE_APP_URL\nCommit: $BITRISE_GIT_COMMIT - $BITRISE_GIT_MESSAGE \nGit URL: $GIT_REPOSITORY_URL \n"
fi

if [ $BITRISE_BUILD_STATUS -eq 0 ] ; then
	if [ ! -z "$TELEGRAM_SUCCESS_MESSAGE" ] ; then
		MESSAGE="$TELEGRAM_SUCCESS_MESSAGE"
	else
		MESSAGE="✅ *$BITRISE_APP_TITLE*: build $BITRISE_BUILD_NUMBER passed! 💚\nURL: $BITRISE_APP_URL\n"
	fi
fi

curl -X POST -H "Content-Type: application/json" -d "{ \"chat_id\": \"$TELEGRAM_CHAT_ID\", \"text\":\"$MESSAGE\", \"parse_mode\": \"markdown\" }" https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
