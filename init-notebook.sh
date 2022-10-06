#!/bin/sh

# Clone the repository in /home/jovyan/work
REPO=formation-spark
REPO_URL=https://github.com/InseeFrLab/${REPO}.git
git clone $REPO_URL $ROOT_PROJECT_DIRECTORY/${REPO}
chown -R onyxia:users $ROOT_PROJECT_DIRECTORY/${REPO}

# Install dependencies
[ -f $HOME/work/requirements.txt ] && pip install -r $HOME/work/requirements.txt

# Open the relevant notebook when starting Jupyter Lab
jupyter server --generate-config
echo "c.LabApp.default_url = '/lab/tree/$REPO/${IPYNB_PATH%.*}/${IPYNB_PATH}'" >> $HOME/.jupyter/jupyter_server_config.py

