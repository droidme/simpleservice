FROM openjdk:21-jdk-alpine
LABEL authors="droidme"
WORKDIR /app
COPY target/*.jar /app/simpleservice.jar
CMD ["java", "-jar", "/app/simpleservice.jar"]