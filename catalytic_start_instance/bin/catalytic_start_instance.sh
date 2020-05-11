#!/bin/bash  

# Capture JSON provided via StdIn
MessageJSON=$(cat -)

# Extract properties from JSON
WorkflowId=$(echo $MessageJSON | jq -r 'getpath(["configuration", "workflow_id"])')
InstanceName=$(echo $MessageJSON | jq -r 'getpath(["configuration", "instance_name"])')
LogMessage=$(echo $MessageJSON | jq -r 'getpath(["result", "_raw"])')

# Catalytic CLI to start a new instance
CATALYTIC_CREDENTIALS=ADD_YOUR_ACCESS_TOKEN_HERE catalytic instance start "$WorkflowId" "$InstanceName" "--field=message:$LogMessage"
