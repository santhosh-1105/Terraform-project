#!/bin/bash
sudo apt upgrade
sudo apt install python3
sudo apt update
git clone https://github.com/santhosh-1105/car-prediction.git
sudo apt install flask
pip install -r requirements.txt
python3 app.py
