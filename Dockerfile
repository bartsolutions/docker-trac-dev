FROM ubuntu:14.04
MAINTAINER "Walty Yeung"


USER root


#Install Trac


RUN apt-get -y update && \
    apt-get -y install \
        python-pip


EXPOSE 80 443


CMD /bin/bash
