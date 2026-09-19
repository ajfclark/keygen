FROM nginx
WORKDIR /keygen
COPY bin bin
COPY web web
COPY scad scad
COPY Makefile ./
COPY docker/settings.js /keygen/web/js/
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY docker/keygen.sh /docker-entrypoint.d/
RUN apt-get update
RUN apt-get install -y python3 openscad make
WORKDIR /keygen/build
EXPOSE 80/tcp
