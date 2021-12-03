#!/bin/sh

# Clone the repository in /home/jovyan/work
REPO=formation-spark
REPO_URL=https://github.com/InseeFrLab/${REPO}.git
git clone $REPO_URL $ROOT_PROJECT_DIRECTORY/${REPO}
chown -R jovyan:users $ROOT_PROJECT_DIRECTORY/${REPO}

# Install dependencies
[ -f /home/jovyan/work/requirements.txt ] && pip install -r /home/jovyan/work/requirements.txt

# Open a given notebook when starting Jupyter Lab
[ -z "$IPYNB_PATH" ] || echo "c.LabApp.default_url = '/lab/tree/${REPO}/${IPYNB_PATH%.*}/${IPYNB_PATH}'" >> /home/jovyan/.jupyter/jupyter_server_config.py
