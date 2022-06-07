#!/bin/bash

# Usage: backup*.sh dir_to_backup output_dir
# Backs up only new files in the last day
# Outputs in the format backup_TIMESTAMP.tar.gz

if [ $# -lt 2 ]; then
    echo "Usage: backup*.sh dir_to_backup output_dir"
    exit 1
fi

base_dir=$(pwd)
cd "$1"
to_backup_path=$(pwd)
cd "$base_dir"
cd "$2"
output_dir=$(pwd)

cd $to_backup_path
files=$(ls -a)
echo "$files"

one_day_ago=$(date +%s -d "1 day ago")
basho
files_to_backup=()
for file in $files; do
#  echo "for $file comparing $one_day_ago -le $(date -r $file +%s)"
  if [[ $one_day_ago -le $(date -r "$file" +%s) ]] && [[ ! -d "$file" ]]; then
#      echo "adding $file"
      files_to_backup+=($file)
  fi
done
echo "files_to_backup is ${files_to_backup[*]}"

output_path="$output_dir/backup_$(date +%Y-%m-%d-%H-%M-%S).tar.gz"
echo "output_path is ${output_path}"
tar -cvzf "$output_path" ${files_to_backup[*]}


#