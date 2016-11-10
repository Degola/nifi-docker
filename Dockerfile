FROM java:8
MAINTAINER Sebastian Lagemann <docker@degola.de>
LABEL Description='This is a nifi 1.0.0-Beta image' Version='1.0.0-Beta'
WORKDIR /opt
VOLUME ["/opt/conf-local/"]

RUN apt-get update && apt-get install -y wget
RUN wget --content-disposition http://ftp.piotrkosoft.net/pub/mirrors/ftp.apache.org/nifi/1.0.0/nifi-1.0.0-bin.tar.gz
RUN apt-get purge -y wget
RUN tar -xzvf nifi*.tar.gz
RUN rm nifi-1.0.0*.tar.gz
RUN mv nifi-1.0.0 nifi
RUN mkdir nifi/logs
RUN rm -R nifi/conf && ln -sf ../conf-local/conf ./nifi/conf
EXPOSE 8080
COPY ./docker-entrypoint.sh /
RUN rm /opt/nifi/lib/nifi-standard-nar-1.0.0.nar
COPY ./nifi-standard-nar-1.1.0-SNAPSHOT.nar /opt/nifi/lib/nifi-standard-nar-1.1.0-SNAPSHOT.nar
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
