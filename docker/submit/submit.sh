#!/bin/bash

export SPARK_MASTER_URL=spark://${SPARK_MASTER_NAME}:${SPARK_MASTER_PORT}
export SPARK_HOME=/spark

echo "Submit application ${SPARK_APPLICATION_JAR_LOCATION} with main class ${SPARK_APPLICATION_MAIN_CLASS} to Spark master ${SPARK_MASTER_URL}"
echo "Passing arguments ${SPARK_APPLICATION_ARGS}"
/spark/bin/spark-submit \
    --class "${SPARK_APPLICATION_MAIN_CLASS}" \
    --master "${SPARK_MASTER_URL}" \
    --executor-memory 2G \
    --conf "spark.hadoop.fs.s3a.endpoint=${SPARK_S3_ENDPOINT}" \
    --conf "spark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem"\
    --conf "spark.hadoop.fs.s3a.path.style.access=true" \
    --conf "spark.hadoop.fs.s3a.access.key=abc" \
    --conf "spark.hadoop.fs.s3a.secret.key=xyz" \
    --conf "spark.hadoop.fs.s3a.fs.s3a.session.token=REALLYREALLYLONGVALUE" \
    --conf "spark.hadoop.fs.s3a.aws.credentials.provider=org.apache.hadoop.fs.s3a.TemporaryAWSCredentialsProvider" \
    "${SPARK_APPLICATION_JAR_LOCATION}" \
    -s 8767266 -d 2021-02-01 -b 1 -c /app/config.conf
