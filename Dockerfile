FROM node:alpine

EXPOSE 8000

RUN \
    apk add --no-cache python make g++ && \
    apk add vips-dev fftw-dev bash git autoconf automake libtool nasm --update-cache \
    --repository http://dl-3.alpinelinux.org/alpine/edge/community \
    --repository http://dl-3.alpinelinux.org/alpine/edge/main && \
    rm -fR /var/cache/apk/*

WORKDIR /app
COPY package.json .
COPY yarn.lock .
RUN npm install
COPY . .

USER node
#CMD ["gatsby", "develop", "-H", "0.0.0.0"]
#CMD ["tail", "-f", "/dev/null"]