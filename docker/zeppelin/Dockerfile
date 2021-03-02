FROM apache/zeppelin:0.9.0

ENV SPARK_VERSION=3.0.1
ENV HADOOP_VERSION=3.2
ENV HADOOP_AWS_VERSION=3.2.0
ENV AWS_SDK_VERSION=1.11.655

USER root

RUN apt-get update &&  apt-get install -y curl unzip wget grep sed vim tzdata && apt-get clean \
    && wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
    && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/$HADOOP_AWS_VERSION/hadoop-aws-$HADOOP_AWS_VERSION.jar \
    && mv hadoop-aws-$HADOOP_AWS_VERSION.jar spark/jars \
    && wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.655/aws-java-sdk-bundle-1.11.655.jar \
    && mv aws-java-sdk-bundle-1.11.655.jar spark/jars \
    && wget https://repo1.maven.org/maven2/com/google/guava/guava/27.0-jre/guava-27.0-jre.jar \
    && mv guava-27.0-jre.jar spark/jars \
    && rm spark/jars/guava-14.0.1.jar \
    && cd /


COPY docker/zeppelin/airline-notebooks /opt/zeppelin/notebook/airline-notebooks
RUN chmod -R 777 /opt/zeppelin/notebook/airline-notebooks/

USER 1000
