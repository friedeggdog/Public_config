#!/bin/bash

contnt="Hello"

curl \
  -H "Content-Type: application/json" \
  -d '{
    "username": "LORD PONZI",
    "avatar_url": "https://cdn.discordapp.com/avatars/741165176853757992/bdd9facd72549e593bec42bc07c1e55f.webp?size=128",
    "content": "'$contnt'"
    }' \
  $WEBHOOK_URL
