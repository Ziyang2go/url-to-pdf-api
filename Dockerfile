FROM node:8

COPY deploy/yarnkey.gpg /tmp/

RUN apt-key add /tmp/yarnkey.gpg && \
  echo "deb http://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y \
  yarn \
  && rm -rf /var/lib/apt/lists


RUN apt-get update && apt-get install -yq gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget && rm -r /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY package.json .



RUN  yarn install && yarn cache clean

COPY . .

EXPOSE 5000

ENV NODE_ENV=production
ENV PORT=5000

CMD [ "node", "src/index.js" ]