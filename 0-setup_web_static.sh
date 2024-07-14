#!/usr/bin/env bash
# a Bash script that sets up your web servers for the deployment of web_static

sudo apt-get update
sudo apt-get -y install nginx
# Install Nginx if it not already installed
sudo mkdir -p /data/web_static/releases/test/
# Create the folder /data/ if it doesn’t already exist
# Create the folder /data/web_static/ if it doesn’t already exist
# Create the folder /data/web_static/releases/ if it doesn’t already exist
# Create the folder /data/web_static/releases/test/ if it doesn’t already exist
sudo mkdir -p /data/web_static/shared/
# Create the folder /data/web_static/shared/ if it doesn’t already exist
echo '<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>' > /data/web_static/releases/test/index.html
# Create a fake HTML file /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
# Create a symbolic link /data/web_static/current linked to the...
# .../data/web_static/releases/test/ folder. If the symbolic link already...
# ...exists, it should be deleted and recreated every time the script is ran.
sudo chown -hR ubuntu:ubuntu /data/
sudo chmod -R 755 /data/web_static/current
# Give ownership of the /data/ folder to the ubuntu user AND group (you can
# assume this user and group exist). This should be recursive; everything
# inside should be created/owned by this user/group.
#sudo mkdir -p /hbnb_static
#curl -F "/data/web_static/releases/test/index.html" http://localhost/hbnb_static/
sudo sed -i '/listen 80 default_server/a location /hbnb_static {alias /data/web_static/current;\n\t}' /etc/nginx/sites-available/default
# Update the Nginx configuration to serve the content of
# /data/web_static/current/ to hbnb_static
# (ex: https://megakira.tech/hbnb_static).
# Don’t forget to restart Nginx after updating the configuration:
sudo service nginx restart
