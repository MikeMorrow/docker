yum update -y
yum install epel-release -y
# ---------------------------------------------------------------------------
# Install docker
# ---------------------------------------------------------------------------
# yum install docker -y
curl -fsSL https://get.docker.com/ | sed 's/sleep 20/sleep 0/' | sh
systemctl start docker
systemctl enable docker
# ---------------------------------------------------------------------------
# Create docker user
# ---------------------------------------------------------------------------
adduser -g docker docker
echo "vagrant" | passwd docker --stdin
# add docker user to sudoers
echo "docker        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/docker
echo 'Defaults:docker !requiretty'  >> /etc/sudoers.d/docker
chmod 0440 /etc/sudoers.d/docker

# ---------------------------------------------------------------------------
# Create environment
# ---------------------------------------------------------------------------
su - docker -c "docker create -v /sharedata --name datastore fedora /bin/true"
su - docker -c "docker run -d --volumes-from datastore --name client1 fedora /sbin/init"
su - docker -c "docker run -d --volumes-from datastore --name client2 fedora /sbin/init"
su - docker -c "docker run -d --volumes-from client2 --name client3 fedora /sbin/init"
