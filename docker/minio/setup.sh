#!/bin/sh

# We set this so that we see all the executed lines in the console
set -x

# We'll run this function in case we want to upload data to the MinIO container
# This will run unless the `no-data` argument is passed
setup_minio_for_wordcount() {
  echo "Creating s3 'word-count' bucket on minio"
  mc mb s3/word-count --ignore-existing

  echo "Downloading the airlines example data set (https://github.com/jpatokal/openflights)"

  # Create an array of the files we want to upload to MinIO
  # shellcheck disable=SC2039
  declare -a example_files=("airlines" "airports")

  # Loop over the files, downloading them
  for FILE_NAME in "${example_files[@]}"; do
    echo "Downloading: $FILE_NAME "
    wget -O "$FILE_NAME".csv https://raw.githubusercontent.com/jpatokal/openflights/master/data/"$FILE_NAME".dat

    echo "Uploading $FILE_NAME.csv to s3"
    mc cp "$FILE_NAME".csv s3/word-count/flights-data/
  done
}

echo "Creating s3 creds 'word-count' bucket on minio ${S3_ENDPOINT}"
mc alias set s3 "${S3_ENDPOINT}" "${MINIO_ACCESS_KEY}" "${MINIO_SECRET_KEY}" --api S3v4

# This allows us to create an "empty" MinIO if we want
case "$1" in
no-data)
  echo "Skipping 'word-count' setup"
  ;;
"")
  setup_minio_for_wordcount
  ;;
esac

set +x
