#!/bin/sh

#java -cp /rtsdkj_docker_maven-1.0-jar-with-dependencies.jar com.refinitiv.ema.cloud.CloudConsumer "$@"
#java -cp /rtsdkj_docker_maven-1.0-jar-with-dependencies.jar "$@"

java -jar /cloud_consumer-1.0-jar-with-dependencies.jar "$@"