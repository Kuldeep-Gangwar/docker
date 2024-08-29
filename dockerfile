#refering the base image
FROM openjdk:17-jdk-alpine
#setting env variable to refer in later into the file
ENV presentDir=/home
#setting the working directory
WORKDIR $presentDir
#copying the build jar
COPY target/docker-0.0.1-SNAPSHOT.jar .
#suppliying the java command to run
ENTRYPOINT ["java","-jar","docker-0.0.1-SNAPSHOT.jar"]