FROM joshula/redis-sentinel

ADD images/sentinel/sentinel.conf /etc/redis/sentinel.conf
