FROM node

RUN npm install -g yo generator-hubot hubot-hipchat

RUN mkdir /opt/hubot && cd /opt/hubot && \
  git clone --depth=1 https://github.com/jkohlmetz/myhubot.git && \
  cd myhubot && \
  npm install

ENV HUBOT_HIPCHAT_JID=HIPCHAT_JID
ENV HUBOT_HIPCHAT_PASSWORD=HIPCHAT_PWD
ENV HUBOT_PORT 8080
ENV HUBOT_ADAPTER hipchat
ENV HUBOT_NAME myhubot
ENV REDIS_URL=tcp://172.17.0.1:6379

WORKDIR /opt/hubot/myhubot

CMD bin/hubot

