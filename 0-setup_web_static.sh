#!/usr/bin/env bash
# a Bash script that sets up your web servers for the deployment of web_static

apt-get update
apt-get -y install nginx

sudo mkdir -p /data/web_static/releases/test/

sudo mkdir -p /data/web_static/shared/

sudo echo '<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>' > /data/web_static/releases/test/index.html

sudo ln -s -f /data/web_static/releases/test/ /data/web_static/current

sudo chown -R ubuntu:ubuntu /data/

sudo sed -i '/listen 80 default_server/a location /hbnb_static {\n\talias /data/web_static/current;\n\t}' /etc/nginx/sites-available/default

sudo service nginx restart
