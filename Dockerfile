FROM jenkins:1.565.3

# remove executors in master
COPY master-executors.groovy /usr/share/jenkins/init.groovy.d/

USER root

RUN mkdir -p /usr/share/jenkins/plugins && chown -R jenkins /usr/share/jenkins/plugins /usr/share/jenkins/init.groovy.d

USER jenkins

# download swarm plugin

ENV JENKINS_SWARM_VERSION 1.20

RUN curl -sSL --create-dirs -o /usr/share/jenkins/plugins/swarm.hpi https://updates.jenkins-ci.org/download/plugins/swarm/$JENKINS_SWARM_VERSION/swarm.hpi

COPY ./jenkins-init.sh /usr/local/bin/jenkins-init.sh

ENTRYPOINT ["/usr/local/bin/jenkins-init.sh"]
