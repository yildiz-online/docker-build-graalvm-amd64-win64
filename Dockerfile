FROM ubuntu:latest

LABEL maintainer="Grégory Van den Borre vandenborre.gregory@hotmail.fr"

ENV JAVA_FILE=graalvm-ce-java11-20.1.0
ENV JAVA_HOME=/${JAVA_FILE}
ENV M2_HOME=/apache-maven-3.6.3
ENV PATH="${PATH}:${JAVA_HOME}/bin:${M2_HOME}/bin"

RUN apt-get update && apt-get install -y -qq -o Dpkg::Use-Pty=0 wget gcc libc6-dev zlib1g-dev unzip \
&& wget -q https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-20.1.0/graalvm-ce-java11-windows-amd64-20.1.0.zip \
&& unzip graalvm-ce-java11-windows-amd64-20.1.0.zip \
&& java -version \
&& rm graalvm-ce-java11-windows-amd64-20.1.0.zip \
&& wget -q https://apache.belnet.be/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz \
&& tar -xzf apache-maven-3.6.3-bin.tar.gz \
&& rm apache-maven-3.6.3-bin.tar.gz \
&& mvn -v \
&& apt-get purge -y -q wget

RUN gu install native-image
