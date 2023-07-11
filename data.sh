#!/bin/bash
sudo yum -y upgrade
sudo yum -y install git
git clone https://github.com/santhosh-1105/car-prediction.git
cd car-prediction/ 
sudo yum -y install python3
sudo yum -y install pip
sudo yum -y install python3-pip
sudo yum -y install requirements.txt
python3 app.py
screen -m -d python3 app.py 
