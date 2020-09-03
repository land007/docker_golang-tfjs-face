#FROM land007/golang-node:latest
FROM land007/l4t-golang-node:latest
#docker build -t land007/l4t-golang-tfjs-face .
#docker run --runtime nvidia --rm -it --name l4t-tfjs land007/l4t-golang-tfjs-face:latest bash

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

ADD face-api.js /node_/face-api.js

RUN . $HOME/.nvm/nvm.sh && cd / && npm install @tensorflow/tfjs @tensorflow/tfjs-node socket.io-client && \
#	cd /node_ && git clone https://github.com/justadudewhohacks/face-api.js.git && \
	. $HOME/.nvm/nvm.sh && cd /node_/face-api.js/ && npm i && cd /node_/face-api.js/examples/examples-nodejs/ && npm i && npm install -g node-pre-gyp ts-node typescript && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time && \
	echo "land007/golang-tfjs-face" >> /.image_names && \
	echo "land007/golang-tfjs-face" > /.image_name

RUN . $HOME/.nvm/nvm.sh && cd /node_modules/@tensorflow/tfjs-node && node-pre-gyp install --build-from-source
RUN . $HOME/.nvm/nvm.sh && cd /node_/face-api.js/node_modules/@tensorflow/tfjs-node/ && node-pre-gyp install --build-from-source

#nvm exec 9.11.2 node --version
#nvm exec 10.20.0 node --version

#docker stop golang-tfjs-face ; docker rm golang-tfjs-face ; docker run -it --privileged -v ~/docker/golang:/golang -v ~/docker/node:/node -p 80:80 -p 20022:20022 --name golang-node land007/golang-tfjs-face:latest
