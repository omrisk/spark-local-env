FROM zeppelin-spark-base:3.0.1-hadoop3.2

ENV SPARK_MASTER_NAME spark-master
ENV SPARK_MASTER_PORT 7077
ENV SPARK_APPLICATION_JAR_LOCATION /app/application.jar
ENV SPARK_APPLICATION_MAIN_CLASS my.main.Application
ENV SPARK_APPLICATION_ARGS ""
ENV SPARK_SUBMIT_ARGS ""

COPY docker/submit/submit.sh /

RUN chmod +x submit.sh

CMD ["/bin/bash", "/submit.sh"]