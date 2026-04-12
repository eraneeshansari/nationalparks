#FROM registry.access.redhat.com/ubi8/openjdk-11:latest
#RUN pwd
#COPY target/nationalparks.jar /opt
#CMD java -jar /opt/nationalparks.jar
# -----------------------------
# Stage 1: Build JAR
# -----------------------------
FROM maven:3.9.6-eclipse-temurin-11 AS builder

WORKDIR /build
COPY . .
RUN mvn clean package -DskipTests

# -----------------------------
# Stage 2: Run JAR
# -----------------------------
FROM registry.access.redhat.com/ubi8/openjdk-11:latest

COPY --from=builder /build/target/*.jar /opt/app.jar

CMD ["java", "-jar", "/opt/app.jar"]
