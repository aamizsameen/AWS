#!/bin/sh

DIR="/home/new-dir/"
PID='run'
FileType='.zip'

cd /home/new-dir/
ls -lart

while [[ "$PID" = run ]]
do
    pstree -p root
    echo "node process id's"
    read nodeid

    if [[ "$nodeid" = exit ]]; then

            PID='exit'

    fi

    if [[ "$nodeid" != exit ]]; then

        kill -9 ${nodeid} 
        pstree -p root
        sleep 10s
    fi
done

if [ -d "$DIR" ]; then
    rm -rf *
    ls -lart

    echo "File Name  eg: API_15_DEC_2021.zip"
    read name

    if [[ "$name" == *"$FileType"* ]]; then

        cp /home/files/${name} .
        ls -lart

        unzip -o ${name} 
        sleep 10s

        cd ~
        ls -lart
        mv .npmrc .npmrc_original

        cd /home/new-dir/

        npm i
        npm i 
        cd ~
        ls -lart

        mv .npmrc_original .npmrc
        cd /home/new-dir/
        npm run prod
    fi
else
    echo "Error: ${DIR} not found."
fi