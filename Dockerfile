FROM jenkins:1.565.1

USER root

# remove executors in master
ADD master-executors.groovy /tmp/WEB-INF/init.groovy.d/

# install swarm plugin
RUN curl -Ls --create-dirs -o /tmp/WEB-INF/plugins/swarm.hpi https://updates.jenkins-ci.org/latest/swarm.hpi

# repackage the war
RUN cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/*/* && rm -rf /tmp/WEB-INF

USER jenkins
