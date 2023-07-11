#!/bin/bash
sudo yum install python3 -y
sudo yum install pip -y
git clone https://github.com/santhosh-1105/car-prediction.git
cd car-prediction/ 
sudo yum install requirements.txt
sudo yum install python3-pip -y
python3 app.py
screen -m -d python3 app.py 
