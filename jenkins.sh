#!/bin/bash

# start the war expansion, then kill it
java -jar /usr/share/jenkins/jenkins.war --prefix=$JENKINS_PREFIX &
PID=$!

while [ ! -d $JENKINS_HOME/war/WEB-INF/plugins ]
do
  echo "Waiting for Jenkins to expand war"
  sleep 2
done

kill $PID

echo Adding Jenkins customizations
cp -r /usr/share/jenkins/war/* $JENKINS_HOME/war/

echo "Restarting jenkins"

exec java -jar /usr/share/jenkins/jenkins.war --prefix=$JENKINS_PREFIX
