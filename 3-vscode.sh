#! /bin/bash

# If VS Code not installed, install it
if ! command -v code &> /dev/null
then
    echo "VS Code could not be found, installing..."
    sudo apt update -y && apt upgrade -y
    sudo snap install --classic code
    exit
fi

EXTENSIONS=(
    "akamud.vscode-theme-onedark"
    "ms-dotnettools.csharp"
    "streetsidesoftware.code-spell-checker"
    "ms-azuretools.vscode-docker"
    "eamodio.gitlens"
    "techer.open-in-browser"
    "esbenp.prettier-vscode"
    "ms-python.python"
    "vscode-icons-team.vscode-icons"
    "coenraads.bracket-pair-colorizer"
)


for ext in $(echo ${EXTENSIONS[*]});
do
    echo "Installing '$ext'..."
    code --install-extension $ext
done

cp vscode/settings.json $HOME/.config/Code/User/settings.json