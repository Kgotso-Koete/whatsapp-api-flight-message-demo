#!/bin/bash
echo "Python Version:" > env_info.txt
python --version >> env_info.txt

echo -e "\nPip Version:" >> env_info.txt
pip --version >> env_info.txt

echo -e "\nInstalled Packages:" >> env_info.txt
pip freeze >> requirements.txt
