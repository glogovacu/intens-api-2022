FROM maven:3.8.4-openjdk-8 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src

ENV PORT 8080
EXPOSE 8080

RUN mvn clean package

FROM openjdk:8-jre-slim
WORKDIR /app
COPY --from=build /app/target/praksa2022-0.0.1-SNAPSHOT.jar ./app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]