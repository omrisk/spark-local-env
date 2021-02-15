FROM apache/zeppelin:0.9.0

ENV SPARK_VERSION=3.0.1
ENV HADOOP_VERSION=3.2

USER root

RUN apt-get update &&  apt-get install -y curl unzip wget grep sed vim tzdata && apt-get clean \
    && wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
    && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

USER 1000
