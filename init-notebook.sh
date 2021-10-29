#!/bin/sh

# Clone the repository in /home/jovyan/work
git clone $REPO_URL /home/jovyan/work/spark-formation
chown -R jovyan:users /home/jovyan/work/spark-formation

# Install dependencies
[ -f /home/jovyan/work/requirements.txt ] && pip install -r /home/jovyan/work/requirements.txt

# Open a given notebook
[ -z "$IPYNB_PATH" ] || echo "c.NotebookApp.default_url = '/tree/spark-formation/${IPYNB_PATH}'" >> /home/jovyan/.jupyter/jupyter_notebook_config.py
