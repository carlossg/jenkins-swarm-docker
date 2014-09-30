FROM jenkins

USER root

# remove executors in master
ADD master-executors.groovy /tmp/WEB-INF/init.groovy.d/

# install swarm plugin and repackage war
RUN curl -Ls --create-dirs -o /tmp/WEB-INF/plugins/swarm.hpi https://updates.jenkins-ci.org/latest/swarm.hpi \
  && cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/*/* && rm -rf /tmp/WEB-INF

# work around permissions issues in mounted volumes https://github.com/cloudbees/jenkins-ci.org-docker/pull/14
ENV JENKINS_USER jenkins
ADD ./jenkins.sh /usr/local/bin/jenkins.sh
RUN chmod +x /usr/local/bin/jenkins.sh
