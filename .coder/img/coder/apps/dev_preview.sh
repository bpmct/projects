# This script will allow you to preview changes
# when modifying the .coder/img/coder/apps folder

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

#!/bin/bash

sudo rm -r /coder/apps
sudo ln -s $SCRIPT_DIR /coder/apps

echo "--------"
echo "Created symbolic link from $SCRIPT_DIR to /coder/apps"
echo ""
echo "Rebuild your workspace with \"coder envs rebuild $CODER_ENVIRONMENT_NAME\" to reset your changes"
echo "--------"