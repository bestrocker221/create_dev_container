#!/bin/bash

# Creates devcontainer config for few code languages to easily startup a devcontainer in vscode

# Function to create a Python devcontainer
create_python_devcontainer() {
    mkdir -p .devcontainer
    cat <<EOF > .devcontainer/devcontainer.json
{
    "name": "Python DevContainer",
    "image": "mcr.microsoft.com/devcontainers/python:3",
    "workspaceFolder": "/workspace",
    "mounts": [
        "source=\${localWorkspaceFolder},target=/workspace,type=bind"
    ],
    "customizations": {
        "vscode": {
            "extensions": ["ms-python.python"]
        }
    },
    "postCreateCommand": "pip install -r requirements.txt"
}
EOF
}

# Function to create a Go devcontainer
create_go_devcontainer() {
    mkdir -p .devcontainer
    cat <<EOF > .devcontainer/devcontainer.json
{
    "name": "Go DevContainer",
    "image": "mcr.microsoft.com/devcontainers/go:latest",
    "workspaceFolder": "/workspace",
    "mounts": [
        "source=\${localWorkspaceFolder},target=/workspace,type=bind"
    ],
    "customizations": {
        "vscode": {
            "extensions": ["golang.go"]
        }
    },
    "postCreateCommand": "go mod tidy"
}
EOF
}

# Function to create a Node.js devcontainer
create_node_devcontainer() {
    mkdir -p .devcontainer
    cat <<EOF > .devcontainer/devcontainer.json
{
    "name": "Node.js DevContainer",
    "image": "mcr.microsoft.com/devcontainers/javascript-node:0-18",
    "workspaceFolder": "/workspace",
    "mounts": [
        "source=\${localWorkspaceFolder},target=/workspace,type=bind"
    ],
    "customizations": {
        "vscode": {
            "extensions": ["dbaeumer.vscode-eslint"]
        }
    },
    "postCreateCommand": "npm install"
}
EOF
}

# Detect the project type
if [ -f "requirements.txt" ]; then
    echo "Python project detected."
    create_python_devcontainer
elif [ -f "go.mod" ]; then
    echo "Go project detected."
    create_go_devcontainer
elif [ -f "package.json" ]; then
    echo "Node.js project detected."
    create_node_devcontainer
else
    echo "Project type not supported by the script."
    exit 1
fi

# Instructions to open the project in the container
echo "Devcontainer setup complete. Open the project in VS Code and reopen it in the container."
