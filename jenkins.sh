#!/bin/bash

# start the war expansion, then kill it
java -jar /usr/share/jenkins/jenkins.war --prefix=$JENKINS_PREFIX 2>&1 | while read LOGLINE
do
  echo $LOGLINE
  [[ "${LOGLINE}" == *"Started SelectChannelConnector"* ]] && pkill -P $$ java
done

echo Adding Jenkins customizations
cp -r /usr/share/jenkins/war/* $JENKINS_HOME/war/

echo "Restarting jenkins"

exec java -jar /usr/share/jenkins/jenkins.war --prefix=$JENKINS_PREFIX
