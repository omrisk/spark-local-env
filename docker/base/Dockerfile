FROM alpine:3.10

ENV SPARK_VERSION=3.0.1
ENV HADOOP_VERSION=3.2
ENV HADOOP_AWS_VERSION=3.2.0
ENV AWS_SDK_VERSION=1.11.655

RUN apk add --no-cache curl bash openjdk11-jre nss libc6-compat \
        && ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2 \
        # Fetch spark Jar
        && wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
        && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
        && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
        && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
        # Fetch AWS Jars
        && wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/$HADOOP_AWS_VERSION/hadoop-aws-$HADOOP_AWS_VERSION.jar \
        && mv hadoop-aws-$HADOOP_AWS_VERSION.jar spark/jars \
        && wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.655/aws-java-sdk-bundle-1.11.655.jar \
        && mv aws-java-sdk-bundle-1.11.655.jar spark/jars \
        # Remove bad guava version, see https://issues.apache.org/jira/browse/HIVE-22915
        && wget https://repo1.maven.org/maven2/com/google/guava/guava/27.0-jre/guava-27.0-jre.jar \
        && mv guava-27.0-jre.jar spark/jars \
        && rm spark/jars/guava-14.0.1.jar \
        && cd /
