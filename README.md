## Setting up the virtual environment and installing dependancies

# Creating the virtual environment with venv in flask_app_template/.venv

python -m venv .venv

# Sourcing the environment and upgrading pip
# If needed : chmod u+x .venv/bin/activate

. .venv/bin/activate

# Upgrading pip

pip install --upgrade pip

# Installing the dev requirements

pip install -r requirements_dev.txt

# If we need to add the path of ou module of PYTHONPATH

cat >> .venv/bin/activate << EOF
PYTHONPATH="$(pwd)/project_name"
export PYTHONPATH
EOF


cat >> tmp/test << EOF

PYTHONPATH="$(pwd)/project_name"
export PYTHONPATH

EOF