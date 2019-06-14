FROM land007/golang-node:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN . $HOME/.nvm/nvm.sh && cd / && npm install @tensorflow/tfjs @tensorflow/tfjs-node socket.io-client && \
	cd /node_ && git clone https://github.com/justadudewhohacks/face-api.js.git && \
	. $HOME/.nvm/nvm.sh && cd /node_/face-api.js/ && npm i && cd /node_/face-api.js/examples/examples-nodejs/ && npm i && npm install -g ts-node && npm install -g typescript && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time && \
	echo "land007/golang-tfjs-face" >> /.image_names && \
	echo "land007/golang-tfjs-face" > /.image_name

#docker stop golang-tfjs-face ; docker rm golang-tfjs-face ; docker run -it --privileged -v ~/docker/golang:/golang -v ~/docker/node:/node -p 80:80 -p 20022:20022 --name golang-node land007/golang-tfjs-face:latest
