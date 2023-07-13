#!/bin/bash
WEBHOOK_URL="https://discord.com/api/webhooks/1094200174311653466/L0N2ynnORUgFk_e92l-4kyUr3b3AAsKP0K25YvAiqbLOHUYbwRpAFm_EIK35aC01WmrC"
curl -H "Authorization: NzQxMTY1MTc2ODUzNzU3OTky.GMYMUo.i52rh0tC0IVan35a0SYtxEhN8Md_ni_Bp_o06g" https://discord.com/api/v10/channels/1022909680617521324/messages?limit=3 > /home/jagannathanm/programs/minDiscord/output.json

contnt="$(python /home/jagannathanm/programs/minDiscord/gui.py)"

curl -H "Content-Type: application/json" -d '{"username": "LORD PONZI", "avatar_url": "https://cdn.discordapp.com/avatars/741165176853757992/bdd9facd72549e593bec42bc07c1e55f.webp?size=128", "content": "'"$contnt"'"}' $WEBHOOK_URL
