#!/bin/bash

# Set the challenge file path
CHALLENGE_FILE="./code"

# Generate a random challenge and save it to the challenge file
challenge=$(cat /dev/urandom | tr -dc '0-9' | fold -w 6 | head -n 1)
echo $challenge > $CHALLENGE_FILE

# Check the code
code=$(cat ./code)

# Send the code to the Telegram bot using curl (with output redirection to /dev/null)
bot_token="token"
chat_id="id"
curl -s -X POST "https://api.telegram.org/bot$bot_token/sendMessage" -d "chat_id=$chat_id&text=$code" > /dev/null

# Prompt the user to enter the challenge response
echo "Hi, you want to log in to this account. Then repeat the code that was sent:"
read -s -n 6 response

# Check if the challenge response matches the expected value
if [ "$response" == "$challenge" ]; then
  # If the challenge response is correct, allow the user to continue to /bin/bash
  rm -rf $CHALLENGE_FILE
  exec /bin/bash
else
  # If the challenge response is incorrect, verbreek verbinding
  rm -rf $CHALLENGE_FILE
  echo -e "\nFoutieve code. Verbinding wordt verbroken."
  exit

fi

