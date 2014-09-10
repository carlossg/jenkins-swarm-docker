docker-jenkins-swarm
====================

Docker image for Jenkins, with swarm plugin installed.
Based on the [official image](https://registry.hub.docker.com/_/jenkins/).

# Running

    docker run -p 8080:8080 -p 37727:37727 csanchez/jenkins-swarm

# Building

    docker build -t csanchez/jenkins-swarm .
