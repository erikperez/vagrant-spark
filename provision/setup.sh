#!/bin/bash

#Update packages
echo 'Provisioning started'
echo 'Adding repository for java8'
apt-add-repository ppa:webupd8team/java -y
echo 'Updating packages'
apt-get update -y
echo 'Installing wget'
apt-get install wget -y -f
echo 'Installing git'
apt-get install git -y -f
echo 'Installing oracle-java8'
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
apt-get install oracle-java8-installer -y -f

#SCALA
echo 'Downloading scala 2.11.7'
wget http://downloads.typesafe.com/scala/2.11.7/scala-2.11.7.tgz
mkdir /usr/local/src/scala
tar xvf scala-2.11.7.tgz -C /usr/local/src/scala/

#Setup SCALA_HOME and add to PATH
echo 'Setting environment variable SCALA_HOME and adding it to PATH'
echo '#VAGRANT SETUP' >> .bashrc
echo 'export SCALA_HOME=/usr/local/src/scala/scala-2.11.7' >> .bashrc
echo 'export PATH=$PATH:$SCALA_HOME/bin' >> .bashrc

#Reload bash
. .bashrc

echo 'Downloading spark 1.6.0'
wget http://www.eu.apache.org/dist/spark/spark-1.6.0/spark-1.6.0.tgz
tar xvf spark-1.6.0.tgz
cd spark-1.6.0
echo 'Building spark'
build/sbt assembly
