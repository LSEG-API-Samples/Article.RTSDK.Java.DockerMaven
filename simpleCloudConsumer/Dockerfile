# Maven 
FROM maven:3.8.1-openjdk-11 AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn -e -B dependency:resolve
COPY src ./src
RUN mvn -e -B package

# RTSDK Java
FROM openjdk:11
COPY --from=builder /app/target/cloud_consumer-1.0-jar-with-dependencies.jar /
COPY EmaConfig.xml .
COPY etc ./etc
COPY run.sh ./run.sh
# Use shell script to support passing application name and its agruments to entrypoint
ENTRYPOINT [ "/run.sh" ]