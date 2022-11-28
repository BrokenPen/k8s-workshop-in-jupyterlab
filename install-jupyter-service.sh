#!/bin/bash
# This script installs and enables/starts a systemd service

# install python3 pip3 nodejs npm
echo $1 | sudo -S apt update -y
echo $1 | sudo -S  apt install python3 python3-pip nodejs vim npm -y


## check kubectl exist
if ! [ -x "$(command -v kubectl)" ]; then
  echo 'Error: kubectl is not installed.' >&2
  echo $1 | sudo -S apt-get install -y ca-certificates curl  
  echo $1 | sudo -S curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
  echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  echo $1 | sudo -S  apt-get update
  echo $1 | sudo -S  apt-get install -y kubectl
else
  echo "kubectl already installed"
fi

echo $1 | sudo -S apt install -y git 

# install dependency
pip install jinja2==3.0.3

# install jupyterlab
pip install jupyterlab

NAME=jupyter-lab

# Create service file
echo $1 | sudo -S bash -c "cat  > /etc/systemd/system/${NAME}.service <<EOF
[Unit]
Description=${NAME}
[Service]
Type=simple
ExecStart=/home/ubuntu/.local/bin/jupyter lab --ip=0.0.0.0 --no-browser --allow-root --collaborative --LabApp.token='ubuntu'
WorkingDirectory=/home/ubuntu
User=ubuntu
Group=ubuntu
Restart=on-failure
RestartSec=5s
[Install]
WantedBy=multi-user.target
EOF"

# Enable and start service
echo $1 | sudo -S  systemctl enable --now ${NAME}

echo
echo ------------------------------------------------
echo
echo Your IP
hostname -I
echo
echo access link http://your-ip:8888/lab?token=ubuntu
echo
echo or if you like to use ssh port forward
echo
echo ssh you-vm-ip -l ubuntu -L localhost:8888:localhost:8888
echo
echo http://localhost:8888/lab?token=ubuntu
