#!/bin/sh

# Clone the repository in /home/jovyan/work
REPO=formation-spark
REPO_URL=https://github.com/InseeFrLab/${REPO}.git
git clone $REPO_URL $ROOT_PROJECT_DIRECTORY/${REPO}
chown -R onyxia:users $ROOT_PROJECT_DIRECTORY/${REPO}

# Install dependencies
[ -f $HOME/work/formation-spark/requirements.txt ] && pip install -r $HOME/work/formation-spark/requirements.txt

# Open the relevant notebook when starting Jupyter Lab
jupyter server --generate-config
echo "c.LabApp.default_url = '/lab/tree/formation-spark/${IPYNB_PATH%.*}/${IPYNB_PATH}'" >> $HOME/.jupyter/jupyter_server_config.py
echo "c.IPKernelApp.capture_fd_output = False" >> $HOME/.jupyter/jupyter_server_config.py

