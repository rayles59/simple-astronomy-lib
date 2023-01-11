FROM jenkins/jenkins:lts
USER root
RUN apt-get update && \
    apt-get -y install openjdk-11-jdk maven
USER jenkins