FROM alpine:3.10

ENV SPARK_VERSION=3.0.1
ENV HADOOP_VERSION=3.2
ENV HADOOP_AWS_VERSION=3.3.0
ENV AWS_SDK_VERSION=1.11.946

RUN apk add --no-cache curl bash openjdk11-jre nss libc6-compat \
      && ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2 \
      # Fetch spark Jar
      && wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
      && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      # Fetch AWS SDK Jars
      && wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk/$AWS_SDK_VERSION/aws-java-sdk-$AWS_SDK_VERSION.jar \
      && mv aws-java-sdk-$AWS_SDK_VERSION.jar spark/jars \
      && wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-s3/$AWS_SDK_VERSION/aws-java-sdk-s3-$AWS_SDK_VERSION.jar \
      && mv aws-java-sdk-s3-$AWS_SDK_VERSION.jar spark/jars \
      && wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-core/$AWS_SDK_VERSION/aws-java-sdk-core-$AWS_SDK_VERSION.jar \
      && mv aws-java-sdk-core-$AWS_SDK_VERSION.jar spark/jars \
      # Fetch Hadoop Jar
      && wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/$HADOOP_AWS_VERSION/hadoop-aws-$HADOOP_AWS_VERSION.jar \
      && mv hadoop-aws-$HADOOP_AWS_VERSION.jar spark/jars \
      && cd /
