FROM node:6-wheezy

EXPOSE 3000

COPY . /

RUN cd /packages/loopback-connector-fabric && npm link \
  && cd /packages/fabric-rest && npm link loopback-connector-fabric \
  && npm install

WORKDIR /packages/fabric-rest

CMD node . --hfc-logging '{"debug":"console"}'