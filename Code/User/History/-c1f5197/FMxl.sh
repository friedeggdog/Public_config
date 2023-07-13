#!/bin/bash

WEBHOOK_URL="https://discord.com/api/webhooks/1092823405151146098/aivVBqhvlsoB3de0BM-KRH5lmUjgwVJ2Fp0TirXskYqcRmXXh1Nm3WDKvLiLnAor4xK9"
contnt="$(python /home/jagannathanm/programs/minDiscord/gui.py)"

curl -H "Content-Type: application/json" -d '{"username": "LORD PONZI", "avatar_url": "https://cdn.discordapp.com/avatars/741165176853757992/bdd9facd72549e593bec42bc07c1e55f.webp?size=128", "content": "'Many'"}' $WEBHOOK_URL
