#!/bin/sh
TOMCAT_HOME=/opt/soft/tomcat
echo $(cd "$(dirname $0)"; pwd)
CATALINA_BASE=$(cd "$(dirname $0)"; pwd)
CATALINA_PID=$CATALINA_BASE/tomcat.pid

JAVA_HOME=/opt/soft/java
CLASSPATH=$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
PATH=$PATH:$JAVA_HOME/bin

WF_USPCLUSTER=`echo $CATALINA_BASE | awk -F "/" '{print $NF}'`
echo "Using WF.uspcluster: $WF_USPCLUSTER"

export TOMCAT_HOME CATALINA_BASE CATALINA_PID JAVA_HOME CLASSPATH PATH JAVA_OPTS WF_USPCLUSTER

proj_dir=`basename $CATALINA_BASE`
/opt/soft/tomcat/bin/catalina.sh stop
sleep 5
if [[ -n "$proj_dir" ]]
then
        ps aux | grep "$proj_dir " | grep -v "grep" | grep -v "$CATALINA_BASE/\(start.sh\|stop.sh\|restart.sh\|logs/catalina.out\)" | grep -v "release" > /dev/null
        status=$?
        if [[ $status -eq 0 ]] || [[ -s $CATALINA_PID  ]]
        then
                echo "kill it"
                ps aux | grep "$proj_dir " | grep -v "grep" | grep -v "$CATALINA_BASE/\(start.sh\|stop.sh\|restart.sh\|logs/catalina.out\)" | grep -v "release" |  awk '{print $2}' | xargs -i kill -9 {}
                > $CATALINA_PID
        fi
else
        echo "stop failt!!!"
        exit 1
fi