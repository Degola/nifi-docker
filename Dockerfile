FROM java:8
MAINTAINER Sebastian Lagemann <docker@degola.de>
LABEL Description='This is a nifi 1.0.0-Beta image' Version='1.0.0-Beta'
WORKDIR /opt

RUN apt-get update && apt-get install -y wget
RUN wget --content-disposition http://ftp.piotrkosoft.net/pub/mirrors/ftp.apache.org/nifi/1.0.0-BETA/nifi-1.0.0-BETA-bin.tar.gz
RUN apt-get purge -y wget
RUN tar -xzvf nifi*.tar.gz
RUN ls -lisa
RUN rm nifi-1.0.0-BETA*.tar.gz
RUN mv nifi-1.0.0-BETA nifi
RUN mkdir nifi/conf-local
RUN cp nifi/conf/flow.xml.gz nifi/conf-local/
RUN cd nifi/conf && ln -sf ../conf-local/flow.xml.gz .
EXPOSE 8080
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
VOLUME ["/opt/nifi/conf-local/"]
ENTRYPOINT ["/docker-entrypoint.sh"]
