docker --version
docker run hello-world
DOCKER PS
docker ps
docker ps -a
docker rm 555bf4765923
docker ps -a
docekr images
docekr images -a
dockerr images -a
docker images -a
docker rmi 1b44b5a3e06a
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk17
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk17
sudo usermod -aG docker jenkins
ls
docker ps -a
docker stop 3002c1c38fa6
docker rm 3002c1c38fa6
docker rm c8cd4a67cb73
docker ps -a
getent group docker
docker run -d   --name jenkins   -p 8080:8080 -p 50000:50000   -v jenkins_home:/var/jenkins_home   -v /var/run/docker.sock:/var/run/docker.sock   -v /usr/bin/docker:/usr/bin/docker   --group-add 995   jenkins/jenkins:lts-jdk17
docker ps
docker exec -it jenkins bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
docker exec -it jenkins bash
sudo ls -la /var/lib/docker/volumes/jenkins_home/_data
sudo ls -la /var/lib/docker/volumes/jenkins_home/_data/secrets || true
docker logs jenkins --tail 200
docker logs jenkins | sed -n '1,200p'
exit
ls
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
free -h
yum install vim -y
sudo yum install vim -y
vim node.js
vim app.js
vim package.json
vim Dockerfile
vim Jenkinsfile
vim docker-install.sh
chmod +x docker-install.sh
./docker-install.sh
