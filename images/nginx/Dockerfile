FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf

ADD bundle.crt /etc/nginx/bundle.crt
ADD live.key /etc/nginx/live.key
ADD live.conf /etc/nginx/conf.d/live.conf
ADD live-static.conf /etc/nginx/conf.d/live-static.conf
ADD live-ssl.conf /etc/nginx/conf.d/live-ssl.conf
ADD dev.conf /etc/nginx/conf.d/dev.conf
#ADD satis.conf /etc/nginx/conf.d/satis.conf
