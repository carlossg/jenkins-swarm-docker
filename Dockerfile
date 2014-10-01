FROM jenkins

USER root

# remove executors in master
COPY master-executors.groovy /tmp/WEB-INF/init.groovy.d/

# install swarm plugin and repackage war
RUN curl -sSL --create-dirs -o /tmp/WEB-INF/plugins/swarm.hpi https://updates.jenkins-ci.org/latest/swarm.hpi \
  && cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/*/* && rm -rf /tmp/WEB-INF

USER jenkins
