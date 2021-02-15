#!/usr/bin/env bash

# Health check will fail till the file is available in the s3-localstack bucket
set -x
if [[ -z $(awslocal s3 ls word-count/airlines.csv) ]]; then
    exit 1
else
    exit 0
fi

set +x
