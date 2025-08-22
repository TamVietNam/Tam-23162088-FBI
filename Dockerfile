# Stage 1: Build bằng Maven
FROM maven:3.9.6-eclipse-temurin-22 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

# Build ra file WAR
RUN mvn clean package -DskipTests

# Stage 2: Run bằng Tomcat 11 + JDK 22
FROM tomcat:11.0.0-jdk22-temurin
WORKDIR /usr/local/tomcat/webapps

# Xóa app mặc định
RUN rm -rf ROOT

# Copy WAR thành ROOT.war
COPY --from=build /app/target/*.war ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
