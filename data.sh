#!/bin/bash
sudo yum install git -y
sudo yum update -y
sudo yum install python3-pip -y
sudo git clone https://github.com/Cjmrp/Car-prediction.git
pip3 install -r requirements.txt
screen -m -d python3 app.py 
