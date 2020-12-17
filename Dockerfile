FROM openjdk/openjdk-11-rhel7:latest

ENV JAVA_APP_JAR ola.jar
ENV AB_ENABLED off
ENV AB_JOLOKIA_AUTH_OPENSHIFT true
ENV JAVA_OPTIONS -Xmx256m -Djava.security.egd=file:///dev/./urandom

ONBUILD RUN mvn install

EXPOSE 8080
USER 1001

ADD target/ola.jar /deployments/
