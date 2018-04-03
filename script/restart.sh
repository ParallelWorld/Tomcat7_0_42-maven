#!/bin/sh
TOMCAT_HOME=/opt/soft/tomcat
CATALINA_BASE=$(cd "$(dirname $0)"; pwd)
CATALINA_PID=$CATALINA_BASE/tomcat.pid

JAVA_HOME=/opt/soft/java
CLASSPATH=$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
PATH=$PATH:$JAVA_HOME/bin
JAVA_OPTS="-server -Xms1g -Xmx1g -Xmn512m -Xss1024K -XX:PermSize=256m -XX:MaxPermSize=512m -XX:ParallelGCThreads=8 -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+UseCMSCompactAtFullCollection -XX:SurvivorRatio=4 -XX:MaxTenuringThreshold=10 -XX:CMSInitiatingOccupancyFraction=80 -agentlib:jdwp=transport=dt_socket,address=52630,suspend=n,server=y"


export TOMCAT_HOME CATALINA_BASE CATALINA_PID JAVA_HOME CLASSPATH PATH JAVA_OPTS

sh $CATALINA_BASE/stop.sh
sh $CATALINA_BASE/start.sh
