#!/bin/bash

if [[ $# != 2 ]]; then
  echo "Usage: bash backup2022-06-03.sh folder_to_backup folder_to_backup_to"
  exit
fi

if [[ ! -d $1 ]]; then
  echo "first argument should be a directory"
  exit
fi

if [[ ! -d $2 ]]; then
  echo "second argument should be a directory"
  exit
fi

cwd="$(pwd)"
cd $2
save_dir="$(pwd)"
cd $cwd
cd $1

one_day_ago=$(date -d "1 day ago" +%s)

new_files=()
for file in $(\ls)
do
  if [[ $(date -r $file +%s) > $one_day_ago ]]; then
    new_files+=("$file")
	  echo "file $file is new" #Do something here.
	else
	  echo "file $file is NOT new" #Do something here.
  fi
done

echo "${new_files[*]}"
tar_file="$save_dir/backup_$(date +%Y-%m-%d).tar.gz"
echo
echo "saving to tar file: $tar_file"
tar -cvzf tar_file ${new_files[*]}
#mv "backup.tar.gz" $cwd
#cd $cwd
#mv