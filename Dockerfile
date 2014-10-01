FROM jenkins

# remove executors in master
COPY master-executors.groovy /usr/share/jenkins/war/WEB-INF/init.groovy.d/

USER root

RUN chown -R jenkins:jenkins /usr/share/jenkins/war

USER jenkins

# download swarm plugin
RUN curl -sSL --create-dirs -o /usr/share/jenkins/war/WEB-INF/plugins/swarm.hpi https://updates.jenkins-ci.org/latest/swarm.hpi

COPY ./jenkins.sh /usr/local/bin/jenkins.sh
