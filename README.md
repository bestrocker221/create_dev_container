# Local DevContainer (with rootless Docker)
This script serves as a helper to generate a devcontainer configuration for development projects usable in VSCode.
Useful for development and especially testing of git repositories of any type.

Especially useful if you are running in rootless docker (nobody likes giving out root privs like bread).

Creates devcontainer config for Python/Go/Node languages to easily startup a devcontainer in vscode.

## Prerequisites
1. Install the  Dev Container and Remote Development plugins
2. Go to Settings, search "docker" and update the following fields:
	- Docker Path
	- Docker Compose Path --> likely similar to `/home/USER/bin/docker`
	- Docker Socket Path --> Likely similar to `/var/run/1000/docker.sock`
3. `cd appFolder && create_dev_container.sh`
4. `.devcontainer/devcontainer.json` gets created
5. CTRL+SHIFT+p  "then Rebuild and Reopen in Container"
6. Done