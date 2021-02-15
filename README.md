# zeppelin-wordcount
A local environment for running a zeppelin notebook with a spark3 engine.
This is a "sandbox" repository for learning about setting up basic spark sandboxes while using a [zeppelin notebook](https://github.com/apache/zeppelin) to perform some simple data exploration and manipulation. 

## Prerequisites
* [docker engine version 20.10.2](https://www.docker.com/products/docker-desktop)
* [docker-compose version 1.27.4](https://docs.docker.com/compose/install/)

## Start your local spark environment
* Start your local spark cluster by running: `docker-compose up`
  * This will build local spark docker images for spark master and worker
  * It will start a simple standalone spark cluster with a single worker
  * A localstack s3 service will  also be launched, you can read more about this super useful project [here](https://github.com/localstack/localstack)
* This may take a few minutes the first time you run
* If you're feeling adventurous, you can start multiple workers by running: `docker-compose up --scale zeppelin-spark-worker=2`

**What's happening?**
* Once done, you can open [localhost:8080](http://localhost:8080/) to view the spark master UI.
* You should see the following UI and a single worker node connected to it:
![SparkUI](imgs/spark-ui-initial.png "Spark UI")
* We've also started a localstack instance running a local s3 service
  * This local s3 has a single bucket `word-count` with a single csv file `airlines.csv` that contains information regarding airlines and airports across the world.
  * You can read more about this open source project at [https://github.com/jpatokal/openflights](https://github.com/jpatokal/openflights)
  * You can connect to it by running `docker exec -it zeppelin-localstack /bin/bash`
  * And see that we've already pushed a sample data set there by running: `awslocal s3 ls word-count/airlines.csv`
  * Download and "peek" at the data by running: 
    * `awslocal s3 cp s3://word-count/airlines.csv .`
    * `cat airlines.csv`
    You should see an output similar to:
```
21251,"Lynx Aviation (L3/SSX)","","","SSX","Shasta","United States","N"
21268,"Jetgo Australia","","JG",\N,"","Australia","Y"
21270,"Air Carnival","","2S",\N,"","India","Y"
21317,"Svyaz Rossiya","Russian Commuter ","7R","SJM","RussianConnecty","Russia","Y"
```


