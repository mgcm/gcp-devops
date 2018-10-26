#!/bin/bash
DATE=$(date +%Y%m%d)
for project in $(gcloud projects list --format="value(projectId)" -q)
do
  echo "> $project"
  $(gcloud config set core/project $project -q --no-user-output-enabled)
  for disk_info in $(gcloud compute disks list --format="csv[no-heading](name,zone)" -q)
  do
    disk=$(echo $disk_info | cut -f1 -d,)
    zone=$(echo $disk_info | cut -f2 -d,)
    echo "  ++ snapshot: $disk-snapshot-$DATE in $zone"
    $(gcloud compute disks snapshot $disk --snapshot-names $disk-snapshot-$DATE --async --zone $zone)
  done
done
