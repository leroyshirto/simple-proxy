FROM node:4.0.0
MAINTAINER leroy.shirto@fasthosts.com
ENV TARGET_HOST=localhost
ENV TARGET_PORT=8080

EXPOSE 8001
EXPOSE 8002
EXPOSE 8003
EXPOSE 8088

RUN mkdir /proxy
COPY package.json /proxy
WORKDIR /proxy

RUN npm install --no-optional --only=production

COPY redirect.js /proxy

CMD ["./node_modules/.bin/anyproxy", "--rule", "redirect.js"]