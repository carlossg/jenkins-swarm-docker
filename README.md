docker-jenkins-swarm
====================

Docker image for Jenkins, with swarm plugin installed.
Based on the [official image](https://registry.hub.docker.com/_/jenkins/).

Can be used with Docker slaves from [`csanchez/jenkins-swarm-slave`](https://registry.hub.docker.com/u/csanchez/jenkins-swarm-slave/)

# Running

    docker run --name jenkins -p 8080:8080 -p 37727:37727 csanchez/jenkins-swarm

# Building

    docker build -t csanchez/jenkins-swarm .
