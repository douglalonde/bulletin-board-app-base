#!/bin/sh
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 CLUSTER" >&2
  exit 1
fi

CLUSTER=$1

ARN=$(aws ecs list-services --cluster $CLUSTER|grep WebsiteService)
SERV=$(echo $ARN|sed 's/.*\///')
S_NAME=${SERV%\"}
echo $S_NAME
echo Running: aws ecs update-service --cluster $CLUSTER --service $S_NAME --force-new-deployment
UPDATE_OUTPUT=$(aws ecs update-service --cluster $CLUSTER --service $S_NAME --force-new-deployment)

echo $UPDATE_OUTPUT
