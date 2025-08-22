# ==========================
# Stage 1: Build bằng Maven
# ==========================
FROM maven:3.9.6-eclipse-temurin-22 AS build
WORKDIR /app

# Copy pom.xml và source
COPY pom.xml .
COPY src ./src

# Build ra WAR
RUN mvn clean package -DskipTests

# ==========================
# Stage 2: Run với Tomcat 11 + JDK 22
# ==========================
FROM tomcat:11.0.0-jdk22-temurin
WORKDIR /usr/local/tomcat/webapps

# Xóa app mặc định
RUN rm -rf ROOT

# Copy WAR build từ stage 1 vào ROOT.war
COPY --from=build /app/target/*.war ROOT.war

# Mở cổng 8080
EXPOSE 8080

CMD ["catalina.sh", "run"]
