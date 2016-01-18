FROM ubuntu:14.04


USER root

WORKDIR /root

#Install basic environment
RUN apt-get -y update && \
    apt-get -y install \
        python-pip \
        git \
	subversion \ 
	python-subversion \
        openssh-server \
	supervisor \
	vim



#Get the latest Trac code
#http://trac.edgewall.org/wiki/TracDev/DevelopmentEnvironmentSetup
#I used git clone instead of svn co here
RUN git clone https://github.com/edgewall/trac trac-trunk 
RUN git clone https://github.com/edgewall/genshi genshi-trunk
RUN cd genshi-trunk && python setup.py develop 
RUN cd trac-trunk && python setup.py develop

#set up test trac
RUN trac-admin test initenv TestTrac  sqlite:db/trac.db
RUN trac-admin test permission add anonymous TRAC_ADMIN 

#set up of trac developer plugin
RUN svn co http://trac-hacks.org/svn/tracdeveloperplugin/trunk/ tracdeveloperplugin
RUN cd tracdeveloperplugin && python setup.py bdist_egg && cp dist/*.egg ../test/plugins


#need this folder pre-exist
RUN mkdir /var/run/sshd
RUN sed -i.bak s/PermitRootLogin\ without-password/PermitRootLogin\ yes/g  /etc/ssh/sshd_config

RUN echo "root:trac" | chpasswd


EXPOSE 8000 22

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY restart_trac.sh /root/restart_trac.sh

#CMD ["bash"]
CMD ["/usr/bin/supervisord"]
