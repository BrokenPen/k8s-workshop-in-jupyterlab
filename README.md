# k8s-workshop-in-jupyterlab

- `/home/ubuntu/k8s-workshop/` 爲我的github repostitory 
- `/home/ubuntu/k8s-workshop/` 的所有內容不會被保存，

## 說明

k8s kubernetes workshop content

## installation 

chmod +x install-jupyter-service.sh

./install-jupyter-service.sh <your-root-account-password>

## k8s-all-ubuntu
    
k8s-all-ubuntu is a bash script with a simple loop to run script over a list of VMs
    
## using k8s-all-ubuntu
 
- k8s-all-ubuntu git clone https://github.com/BrokenPen/k8s-workshop-in-jupyterlab

`k8s-all-ubuntu git -C /home/ubuntu/k8s-workshop-in-jupyterlab/install-jupyter-service.sh <root-password>`
- k8s-all-ubuntu git -C /home/ubuntu/k8s-workshop-in-jupyterlab/install-jupyter-service.sh ubuntu
    
### update 
k8s-all-ubuntu git -C /home/ubuntu/k8s-workshop-in-jupyterlab pull
