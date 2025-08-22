# ==========================
# Stage 1: Build bằng Maven
# ==========================
FROM maven:3.9.6-eclipse-temurin-22 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

# Build ra file WAR
RUN mvn clean package -DskipTests

# ==========================
# Stage 2: Run bằng Tomcat 11 + JDK 22
# ==========================
FROM eclipse-temurin:22-jdk

WORKDIR /usr/local/tomcat

# Cài curl và tải Tomcat 11 (chọn version mới nhất ở Apache Tomcat)
RUN apt-get update && apt-get install -y curl && \
    curl -O https://downloads.apache.org/tomcat/tomcat-11/v11.0.0-M21/bin/apache-tomcat-11.0.0-M21.tar.gz && \
    tar xvf apache-tomcat-11.0.0-M21.tar.gz && \
    mv apache-tomcat-11.0.0-M21/* /usr/local/tomcat/ && \
    rm -rf apache-tomcat-11.0.0-M21.tar.gz apache-tomcat-11.0.0-M21 && \
    rm -rf /usr/local/tomcat/webapps/*

WORKDIR /usr/local/tomcat/webapps

# Copy WAR build từ stage 1 vào Tomcat
COPY --from=build /app/target/*.war ROOT.war

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
