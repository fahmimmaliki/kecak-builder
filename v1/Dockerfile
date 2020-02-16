FROM ubuntu:16.04

MAINTAINER dev@kinnarastudio.com 
ENV JAVA_VERSION openjdk-8-jdk

RUN apt-get update ** apt install $JAVA_VERSION

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 12.13.1

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias kinnara-default $NODE_VERSION \
    && nvm use kinnara-default

RUN npm install -g bower 

RUN if ! [ -e apache-maven-3.3.3-bin.tar.gz ]; then (curl -OL http://mirror.olnevhost.net/pub/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz); fi
RUN tar -zxf apache-maven-3.3.3-bin.tar.gz -C /usr/local/
RUN ln -s /usr/local/apache-maven-3.3.3/bin/mvn /usr/bin/mvn
RUN node -v && npm -v && java --version && mvn -v