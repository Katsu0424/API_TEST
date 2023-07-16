FROM maven:3.9.3-eclipse-temurin-17-alpine AS builder
WORKDIR /srv
COPY src ./src
COPY pom.xml .
# CI/CDでテストするのでここではスキップ
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk-alpine
RUN apk update && apk add mysql-client
COPY --from=builder /srv/target/backendProject-0.0.1-SNAPSHOT.jar /target/backendProject.jar
COPY wait-for-db.sh /wait-for-db.sh
RUN chmod +x /wait-for-db.sh
ENTRYPOINT ["/bin/sh", "/wait-for-db.sh", "java", "-Dfile.encoding=UTF-8", "-jar", "/target/backendProject.jar"]