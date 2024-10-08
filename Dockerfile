
FROM maven:3.8.5-openjdk-17 AS build


WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests


FROM openjdk:17-jdk-alpine

WORKDIR /app


COPY --from=build /app/target/spring-boot-example-0.0.1-SNAPSHOT.jar /app/scale-spring-app.jar


EXPOSE 8081


ENTRYPOINT ["java", "-jar", "/app/scale-spring-app.jar"]
