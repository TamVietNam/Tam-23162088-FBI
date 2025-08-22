# ==========================
# Stage 1: Build bằng Maven
# ==========================
FROM maven:3.9.6-eclipse-temurin-22 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# ==========================
# Stage 2: Run bằng Tomcat 11 + JDK 22
# ==========================
FROM eclipse-temurin:22-jdk

WORKDIR /usr/local

# Cài curl và tải Tomcat 11
RUN apt-get update && apt-get install -y curl tar && \
    curl -O https://downloads.apache.org/tomcat/tomcat-11/v11.0.0-M21/bin/apache-tomcat-11.0.0-M21.tar.gz && \
    tar -xvzf apache-tomcat-11.0.0-M21.tar.gz && \
    mv apache-tomcat-11.0.0-M21 tomcat11 && \
    rm apache-tomcat-11.0.0-M21.tar.gz

WORKDIR /usr/local/tomcat11/webapps

# Xóa app mặc định
RUN rm -rf ROOT

# Copy WAR build từ stage 1 vào ROOT.war
COPY --from=build /app/target/*.war ROOT.war

EXPOSE 8080

CMD ["/usr/local/tomcat11/bin/catalina.sh", "run"]
