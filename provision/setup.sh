#!/bin/bash

#Wget, git, java8
apt-get update -y
apt-get install wget -y -f
apt-get install git -y -f
apt-add-repository ppa:webupd8team/java -y -f
apt-get install oracle-java8-installer -y -f

#SCALA
wget http://downloads.typesafe.com/scala/2.11.7/scala-2.11.7.tgz
mkdir /usr/local/src/scala
tar xvf scala-2.11.7.tgz -C /usr/local/src/scala/

#Setup SCALA_HOME and add to PATH
echo '#VAGRANT SETUP' >> .bashrc
echo 'export SCALA_HOME=/usr/local/src/scala/scala-2.11.7' >> .bashrc
echo 'export PATH=$PATH:$SCALA_HOME/bin' >> .bashrc

#Reload bash
. .bashrc
