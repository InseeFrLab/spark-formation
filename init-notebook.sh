#!/bin/sh

# Clone the repository in /home/jovyan/work
REPO_URL=https://github.com/InseeFrLab/spark-formation.git
DIR=spark-formation
git clone $REPO_URL /home/jovyan/work/$DIR
chown -R jovyan:users /home/jovyan/work/$DIR

# Install dependencies
[ -f /home/jovyan/work/requirements.txt ] && pip install -r /home/jovyan/work/requirements.txt

# Open a given notebook
[ -z "$IPYNB_PATH" ] || echo "c.LabApp.default_url = '/lab/tree/${DIR}/${IPYNB_PATH%.*}/${IPYNB_PATH}'" >> /home/jovyan/.jupyter/jupyter_server_config.py
