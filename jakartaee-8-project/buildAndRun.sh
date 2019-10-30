#!/bin/sh
mvn clean package && sudo docker build -t nkengasong.learning.sample/jakartaee-8-project .
sudo docker run --rm -d -p 9080:9080 -p 9443:9443 -v $HOME/docker/volumes/wad:/opt/ol/wlp/usr/servers/defaultServer/dropins --name jakartaee-8-project nkengasong.learning.sample/jakartaee-8-project

java -jar /home/nkengasong/Programs/wad/wad.jar $HOME/docker/volumes/wad
