FROM land007/golang-node:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN . $HOME/.nvm/nvm.sh && cd / && npm install @tensorflow/tfjs @tensorflow/tfjs-node
RUN cd /node_ && git clone https://github.com/justadudewhohacks/face-api.js.git
RUN . $HOME/.nvm/nvm.sh && cd /node_/face-api.js/ && npm i && cd /node_/face-api.js/examples/examples-nodejs/ && npm i && npm install -g ts-node && npm install -g typescript


#docker stop golang-tfjs-face ; docker rm golang-tfjs-face ; docker run -it --privileged -v ~/docker/golang:/golang -v ~/docker/node:/node -p 80:80 -p 20022:20022 --name golang-node land007/golang-tfjs-face:latest
