#refering the base image
FROM maven:3.8.4-openjdk-17 AS build
#setting env variable to refer in later into the file
ENV presentDir=/app
#setting the working directory
WORKDIR $presentDir
#copying the build jar
COPY  pom.xml .

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
ENV presentDir=/app

WORKDIR $presentDir
COPY --from=build /app/target/docker-0.0.2-SNAPSHOT.jar  /app/docker-0.0.2-SNAPSHOT.jar
#suppliying the java command to run
ENTRYPOINT ["java","-jar","docker-0.0.2-SNAPSHOT.jar"]