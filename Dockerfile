FROM dockerfile/java:oracle-java7

ENV KB_PKG_NAME kibana-4.0.0-linux-x64

RUN \
  cd / && \
  wget https://download.elasticsearch.org/kibana/kibana/$KB_PKG_NAME.tar.gz && \
  tar xvzf $KB_PKG_NAME.tar.gz && \
  rm -f $KB_PKG_NAME.tar.gz && \
  mv /$KB_PKG_NAME /kibana

EXPOSE 5601
ADD kibana.yml /kibana/config/kibana.yml

CMD "/kibana/bin/kibana"

