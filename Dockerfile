FROM debian:buster

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get -y install wget

RUN apt-get -y install nginx
RUN bash
