#!/bin/bash
MIN_DATE=$(date -v -30d +%Y%m%d)
for project in $(gcloud projects list --format="value(projectId)" -q)
do
  echo "> $project"
  $(gcloud config set core/project $project -q --no-user-output-enabled)
  for snapshot in $(gcloud compute snapshots list --format="csv[no-heading](name)" -q)
  do
    REGEX="[0-9]{8}$"
    if [[ $snapshot =~ $REGEX ]]; then
      SNAPSHOT_DATE=${BASH_REMATCH[0]}
      if [[ "$SNAPSHOT_DATE" < "$MIN_DATE" ]]; then
        echo "  ++ snapshot delete: $snapshot"
        $(gcloud compute snapshots delete $snapshot -q)
      fi
    fi
  done
done
