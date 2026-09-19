FROM nginx
WORKDIR /keygen
RUN <<EOF
apt-get update
apt-get install -y python3 openscad make python3-tinycss2 inkscape
EOF
COPY . /keygen/
RUN <<EOF
make clean
make
mv /keygen/docker/settings.js /keygen/web/js/
mv /keygen/docker/nginx.conf /etc/nginx/conf.d/default.conf
mv /keygen/docker/keygen.sh /docker-entrypoint.d/
EOF
EXPOSE 80/tcp
