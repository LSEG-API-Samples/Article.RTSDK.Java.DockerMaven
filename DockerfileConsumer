# Maven 
FROM maven:3.8.1-openjdk-11 AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn -e -B dependency:resolve
COPY src ./src
RUN mvn -e -B package

# RTSDK Java
FROM openjdk:11
COPY --from=builder /app/target/rtsdkj_docker_maven-1.0-jar-with-dependencies.jar /
COPY EmaConfig.xml .
COPY etc ./etc
CMD ["java", "-cp", "/rtsdkj_docker_maven-1.0-jar-with-dependencies.jar","com.refinitiv.ema.consumer.Consumer"]
#CMD ["ls", "-la"]