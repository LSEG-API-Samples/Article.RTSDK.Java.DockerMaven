# Builder Maven Image
# Supported JAVA_VERSION is 11, 17, and 21 (AS of RTSDK Java 2.2.2.L1 - Oct 2024)
ARG JAVA_VERSION=17
ARG VARIANT=alpine 
FROM maven:3.9.10-eclipse-temurin-${JAVA_VERSION}-${VARIANT} as builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean install -Dmaven.test.skip=true

# RTSDK Java
#FROM openjdk:11-jre-slim
FROM eclipse-temurin:${JAVA_VERSION}-jre-${VARIANT}
WORKDIR /app
COPY --from=builder /app/target/cloud_consumer-1.0-jar-with-dependencies.jar .
COPY EmaConfig.xml .
COPY etc ./etc
#COPY run.sh ./run.sh
# Use shell script to support passing application name and its arguments to the ENTRYPOINT
#ENTRYPOINT [ "./run.sh" ]
ENTRYPOINT ["java", "-jar", "./cloud_consumer-1.0-jar-with-dependencies.jar"]
CMD ["-ric", "/EUR="]