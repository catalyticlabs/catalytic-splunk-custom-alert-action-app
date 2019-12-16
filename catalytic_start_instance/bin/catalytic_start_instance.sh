#!/bin/bash  

# Catalytic CLI Credentials
AccessId="YOUR_ACCESS_IDENTIFIER"
Secret="YOUR_SECRET"
Domain="YOUR_CATALYTIC_TEAM_DOMAIN" # ex: `mycompany.pushbot.com`

# Capture JSON provided via StdIn
MessageJSON=$(cat -)

# Extract properties from JSON
PushbotId=$(echo $MessageJSON | jq -r 'getpath(["configuration", "pushbot_id"])')
InstanceName=$(echo $MessageJSON | jq -r 'getpath(["configuration", "instance_name"])')
LogMessage=$(echo $MessageJSON | jq -r 'getpath(["result", "_raw"])')

# Catalytic CLI to start a new instance
CATALYTIC_ACCESS_IDENTIFIER="$AccessId" CATALYTIC_ACCESS_SECRET="$Secret" CATALYTIC_DOMAIN="$Domain" catalytic instance start "$PushbotId" "$InstanceName" "--field=message:$LogMessage"
