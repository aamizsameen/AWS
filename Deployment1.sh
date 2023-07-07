#!/bin/sh

DIR="/home/ec2-user/tomcat/apache-tomcat-9.0.50/webapps/ROOT/"
FileType=".zip"

pwd
ls -lart
cd /home/ec2-user/tomcat/apache-tomcat-9.0.50/bin/
./shutdown.sh

cd /home/ec2-user/tomcat/apache-tomcat-9.0.50/webapps/ROOT/
sleep 5s

if [ -d "$DIR" ]; then

    rm -rf *
    echo "File Name eg : PROD_15_DEC_2021_1.zip"
    read name

    if [[ "$name" == *"$FileType"* ]]; then

        cp /home/files/${name} .
        unzip -o ${name} 
        sleep 5s

        rm -f ${name}
        cd /home/ec2-user/tomcat/apache-tomcat-9.0.50/bin/
        ./startup.sh

    fi

else 
    echo "Error: ${DIR} not found."
fi