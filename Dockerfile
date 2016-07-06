FROM ubuntu:16.04
MAINTAINER Peter Mescalchin <peter@magnetikonline.com>

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install checkinstall python python-pip && \
	apt-get clean

ADD https://github.com/Backblaze/B2_Command_Line_Tool/tarball/master /root/build/
WORKDIR /root/build
RUN tar -xf master && mv Backblaze-B2_Command_Line_Tool-* Backblaze-B2_Command_Line_Tool

WORKDIR /root/build/Backblaze-B2_Command_Line_Tool
RUN echo "magnetikonline: Backblaze B2 CLI" >description-pak && \
	checkinstall -Dy --install=no --nodoc --pkgname=backblaze --pkgversion=0.1 python setup.py install

CMD ["/bin/bash"]
