# Docker
apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

apt-get update

apt-get install docker-ce -y
# change storage driver otherwise a lot of storage will be used
echo -e "{\n  \"storage-driver\": \"overlay2\"\n}" >> /etc/docker/daemon.json

# Docker compose install
curl -L "https://github.com/docker/compose/releases/download/1.28.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

curl -L https://raw.githubusercontent.com/docker/compose/1.28.4/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

echo "Setup Complete"

reboot