#!/bin/sh

if [[ -z "${TRIGGER_URL}" ]]; then
  echo "Missing env TRIGGER_URL. See https://github.com/theRemix/CircleCI-Docker-Webhook for setup instructions."
  exit 1
fi

REF=""
if [[ -z "${CIRCLE_TAG}" ]]; then
  REF=refs/tags/$CIRCLE_TAG
else
  REF=refs/heads/$CIRCLE_BRANCH
fi

echo "Triggering build for $REF"

PAYLOAD="{\"commit\": \"$CIRCLE_SHA1\",\"ref\": \"$REF\",\"default_branch\": \"master\"}"
curl -H "Content-Type: application/json" --data "$PAYLOAD" -X POST $TRIGGER_URL && \
echo "\nTriggered quay build for $CIRCLE_PROJECT_REPONAME"

