FROM dockerfile/java:oracle-java7

ENV KB_PKG_NAME kibana-4.0.0-rc1-linux-x64

RUN \
  cd / && \
  wget https://download.elasticsearch.org/kibana/kibana/$KB_PKG_NAME.tar.gz && \
  tar xvzf $KB_PKG_NAME.tar.gz && \
  rm -f $KB_PKG_NAME.tar.gz && \
  mv /$KB_PKG_NAME /kibana

EXPOSE 5601
ADD kibana.yml /kibana/config/kibana.yml

RUN mkdir /kibana/ssl && \ 
    openssl req -x509 \ 
    -nodes -days 365 \ 
    -newkey rsa:2048 \ 
    -subj "/C=UK/ST=Kibana/L=Kibana/O=Kibana/OU=Kibana/CN=kibana.com" \ 
    -keyout /kibana/ssl/server.key \ 
    -out /kibana/ssl/server.crt

CMD "/kibana/bin/kibana"

