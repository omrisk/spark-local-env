#!/bin/sh

set -x

echo "Creating s3 creds 'word-count' bucket on minio ${S3_ENDPOINT}"
echos mc alias set s3 "${S3_ENDPOINT}" "${MINIO_ACCESS_KEY}" "${MINIO_SECRET_KEY}" --api S3v4

mc alias set s3 "${S3_ENDPOINT}" "${MINIO_ACCESS_KEY}" "${MINIO_SECRET_KEY}" --api S3v4

echo "Creating s3 'word-count' bucket on minio"
mc mb s3/word-count --ignore-existing;

echo "Downloading the airlines example data set (https://github.com/jpatokal/openflights)"

# shellcheck disable=SC2039
declare -a example_files=("airlines" "airports")

for FILE_NAME in "${example_files[@]}"
do
  echo "Downloading: $FILE_NAME "
  wget -O "$FILE_NAME".csv https://raw.githubusercontent.com/jpatokal/openflights/master/data/"$FILE_NAME".dat
  echo "Uploading $FILE_NAME.csv to s3"
  mc cp "$FILE_NAME".csv s3/word-count/flights-data/
done

set +x
