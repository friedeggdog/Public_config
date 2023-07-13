#!/bin/bash

curl -H "Content-Type: application/json" 
  -d '{
    "username": "test",
    "avatar_url": "https://cdn.discordapp.com/avatars/741165176853757992/bdd9facd72549e593bec42bc07c1e55f.webp?size=128",
    "content": "hello"
    }' 
  $WEBHOOK_URL
