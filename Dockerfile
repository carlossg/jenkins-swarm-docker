FROM jenkins:1.565.1

# remove executors in master
COPY master-executors.groovy /usr/share/jenkins/init.groovy.d/

USER root

RUN mkdir -p /usr/share/jenkins/plugins && chown -R jenkins /usr/share/jenkins/plugins /usr/share/jenkins/init.groovy.d

USER jenkins

# download swarm plugin
RUN curl -sSL --create-dirs -o /usr/share/jenkins/plugins/swarm.hpi https://updates.jenkins-ci.org/latest/swarm.hpi

COPY ./jenkins-init.sh /usr/local/bin/jenkins-init.sh

ENTRYPOINT /usr/local/bin/jenkins-init.sh
