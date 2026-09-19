FROM nginx
RUN <<EOF
mkdir /keygen
apt-get update
apt-get install -y python3 openscad
EOF
COPY . /keygen/
RUN <<EOF
mv /keygen/docker/settings.js /keygen/web/js/
mv /keygen/docker/nginx.conf /etc/nginx/conf.d/default.conf
mv /keygen/docker/keygen.sh /docker-entrypoint.d/
EOF
EXPOSE 80/tcp
