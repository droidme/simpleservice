FROM eclipse-temurin:21
LABEL authors="droidme"
WORKDIR /app
COPY target/*.jar /app/simpleservice.jar
CMD ["java", "-jar", "/app/simpleservice.jar"]