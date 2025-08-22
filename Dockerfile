# Stage 1: Build bằng Maven
FROM maven:3.9.6-eclipse-temurin-22 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

# Build và rename file jar thành app.jar
RUN mvn clean package -DskipTests && mv target/*.jar app.jar

# Stage 2: Run bằng JDK 22
FROM eclipse-temurin:22-jdk
WORKDIR /app

# Copy app.jar từ stage build
COPY --from=build /app/app.jar .

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
