#FROM land007/golang-node:latest
FROM land007/l4t-golang-node:latest
#docker build -t land007/l4t-golang-tfjs-face .
#docker run --runtime nvidia --rm -it --name l4t-tfjs land007/l4t-golang-tfjs-face:latest bash

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN . $HOME/.nvm/nvm.sh && cd / && npm install @tensorflow/tfjs @tensorflow/tfjs-node socket.io-client && \
	cd /node_ && git clone https://github.com/justadudewhohacks/face-api.js.git && \
	. $HOME/.nvm/nvm.sh && cd /node_/face-api.js/ && npm i && cd /node_/face-api.js/examples/examples-nodejs/ && npm i && npm install -g ts-node && npm install -g typescript && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time && \
	echo "land007/golang-tfjs-face" >> /.image_names && \
	echo "land007/golang-tfjs-face" > /.image_name

ENV SHIPPABLE_NODE_VERSION=v10.20.0
#ENV NVM_NODEJS_ORG_MIRROR=http://nodejs.org/dist
RUN echo 'export SHIPPABLE_NODE_VERSION=v10.20.0' >> /etc/profile
RUN ls $HOME/.nvm/ && chmod +x $HOME/.nvm/nvm.sh
RUN echo 'export SHIPPABLE_NODE_VERSION=v10.20.0' >> /etc/profile && \
	. $HOME/.nvm/nvm.sh && nvm install $SHIPPABLE_NODE_VERSION && nvm alias default $SHIPPABLE_NODE_VERSION && nvm use default && cd / && npm init -y && npm install -g node-pre-gyp && \
	. $HOME/.nvm/nvm.sh && which node
ENV PATH $PATH:/root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/bin
RUN echo 'export PATH=$PATH:/root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/bin' >> /etc/profile

#RUN . $HOME/.nvm/nvm.sh && npm install -g node-pre-gyp
#RUN apt-get install -y python3

RUN . $HOME/.nvm/nvm.sh && cd /node_modules/@tensorflow/tfjs-node && node-pre-gyp install --build-from-source

#nvm exec 9.11.2 node --version
#nvm exec 10.20.0 node --version

#docker stop golang-tfjs-face ; docker rm golang-tfjs-face ; docker run -it --privileged -v ~/docker/golang:/golang -v ~/docker/node:/node -p 80:80 -p 20022:20022 --name golang-node land007/golang-tfjs-face:latest
