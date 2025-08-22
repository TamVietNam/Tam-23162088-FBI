# ==========================
# Stage 1: Build bằng Maven
# ==========================
FROM maven:3.9.6-eclipse-temurin-22 AS build
WORKDIR /app

# Copy pom.xml và source
COPY pom.xml .
COPY src ./src

# Build ra file JAR
RUN mvn clean package -DskipTests

# ==========================
# Stage 2: Run app bằng JDK 22
# ==========================
FROM eclipse-temurin:22-jdk

WORKDIR /app

# Copy file JAR từ stage build
COPY --from=build /app/target/*.jar app.jar

# Expose cổng 8080 (hoặc port bạn cấu hình trong app)
EXPOSE 8080

# Chạy app
ENTRYPOINT ["java", "-jar", "app.jar"]
