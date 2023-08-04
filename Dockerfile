FROM maven:3.9.3-ibm-semeru-17-focal AS builder
WORKDIR /srv
COPY src ./src
COPY pom.xml .
# CI/CDでテストするのでここではスキップ
RUN mvn clean package -DskipTests

FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu
RUN apt-get update && apt-get install -y mysql-client
COPY --from=builder /srv/target/backendProject-0.0.1-SNAPSHOT.jar /target/backendProject.jar
COPY wait-for-db.sh /wait-for-db.sh
RUN chmod +x /wait-for-db.sh
ENTRYPOINT ["/bin/sh", "/wait-for-db.sh", "java", "-Dfile.encoding=UTF-8", "-jar", "/target/backendProject.jar"]
