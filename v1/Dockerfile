FROM ubuntu:16.04

MAINTAINER dev@kinnarastudio.com 

ENV JAVA_VERSION openjdk-8-jdk

RUN apt-get update && apt install $JAVA_VERSION git curl -y

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 12.13.1

RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v && npm -v

RUN npm install -g bower 

RUN cd /opt/ && wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz \
             && tar -xvzf apache-maven-3.3.9-bin.tar.gz \
             && mv apache-maven-3.3.9 maven
RUN export M2_HOME=/opt/maven && export PATH=${M2_HOME}/bin:${PATH}
RUN mvn --version




 