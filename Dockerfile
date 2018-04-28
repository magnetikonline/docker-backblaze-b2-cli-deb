FROM ubuntu:16.04
MAINTAINER Peter Mescalchin <peter@magnetikonline.com>

ENV VERSION 1.1.0

RUN apt-get update && apt-get upgrade --yes && \
	apt-get install --yes checkinstall python python-pip && \
	apt-get clean

ADD "https://github.com/Backblaze/B2_Command_Line_Tool/archive/v$VERSION.tar.gz" /root/build/
WORKDIR /root/build
RUN tar --extract --file "v$VERSION.tar.gz"

WORKDIR "/root/build/B2_Command_Line_Tool-$VERSION"
RUN echo "magnetikonline: Backblaze B2 CLI" >description-pak && \
	checkinstall \
		--default \
		--install=no \
		--nodoc \
		--pkgname=backblaze-cli \
		--pkgversion=$VERSION \
		--type=debian \
			python setup.py install

CMD ["/bin/bash"]
