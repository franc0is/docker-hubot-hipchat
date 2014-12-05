FROM  ubuntu:14.04

RUN   apt-get update
RUN   apt-get -y install wget git redis-server nodejs npm
RUN   ln -s /usr/bin/nodejs /usr/bin/node

RUN   npm install coffee-script hubot -g
RUN   hubot --create .
RUN   npm install --save hubot-hipchat
RUN   chmod 755 bin/hubot

RUN   apt-get -y install supervisor
RUN   mkdir -p /var/log/supervisor

ADD   hubot-scripts.json hubot-scripts.json
ADD   ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD   supervisord -n
