#!/bin/bash


########################
# Install Java
########################
echo "Installing Java"
yum -y install java-1.8.0-openjdk.x86_64 git

echo "Check java version"
java -version

echo "Setup Java Environment Variables"
cp /etc/profile /etc/profile_backup
cat <<EOT >> /etc/profile
export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk
export JRE_HOME=/usr/lib/jvm/jre
EOT
source /etc/profile
echo $JAVA_HOME
echo $JRE_HOME


########################
# Jenkins
########################
echo "Installing Jenkins"
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
yum -y install deltarpm jenkins

echo "Installing Jenkins plugins"
wget -P /var/lib/jenkins/plugins https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/scriptler/2.9/scriptler-2.9.hpi
wget -P /var/lib/jenkins/plugins https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/greenballs/1.15/greenballs-1.15.hpi
wget -P /var/lib/jenkins/plugins https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/multiple-scms/0.6/multiple-scms-0.6.hpi
wget -P /var/lib/jenkins/plugins https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/email-ext/2.61/email-ext-2.61.hpi
wget -P /var/lib/jenkins/plugins https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/role-strategy/2.6.1/role-strategy-2.6.1.hpi
wget -P /var/lib/jenkins/plugins https://updates.jenkins-ci.org/download/plugins/chucknorris/1.0/chucknorris.hpi
systemctl start jenkins && systemctl enable jenkins


########################
# nginx
########################
echo "Installing nginx"
yum -y install nginx > /dev/null 2>&1


########################
# Configuring nginx
########################
echo "Configuring nginx"
sed -e 's/80/8081/' -i /etc/nginx/nginx.conf
cat > /etc/nginx/conf.d/jenkins.conf << EOF
upstream app_server {
    server 127.0.0.1:8080 fail_timeout=0;
}

server {
    listen 80;
    listen [::]:80 default ipv6only=on;
    server_name jenkins;

    location / {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;

        if (!-f $request_filename) {
            proxy_pass http://app_server;
            break;
        }
    }
}
EOF
systemctl restart  nginx && systemctl restart jenkins
echo "Success"

exit 0
