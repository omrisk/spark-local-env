#!/usr/bin/env bash

set -x

declare -a example_files=("airlines" "airports")
echo "Creating s3 'word-count' bucket on localstack"
awslocal s3 mb s3://word-count

echo "Downloading the airlines example data set (https://github.com/jpatokal/openflights)"

for FILE_NAME in "${example_files[@]}"
do
  echo "Downloading: $FILE_NAME "
  wget -O "$FILE_NAME".csv https://raw.githubusercontent.com/jpatokal/openflights/master/data/"$FILE_NAME".dat
  echo "Uploading $FILE_NAME.csv to s3"
  awslocal s3 cp "$FILE_NAME".csv s3://word-count/
done

set +x