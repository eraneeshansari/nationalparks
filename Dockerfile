FROM registry.access.redhat.com/ubi8/openjdk-11:latest

COPY target/nationalparks.jar /opt

RUN pwd

CMD java -jar /opt/nationalparks.jar
