# DevContainers

Devcontainers are pre-configured development environments that can be used with VSCode. They allow developers to quickly and easily set up a development environment with all the necessary tools, dependencies, and settings required for their project.

One of the nice things about using Devcontainers is that it provides a consistent and reproducible development environment, regardless of the developer's local machine or operating system. This is particularly helpful for teams working on the same project, as everyone can use the same Devcontainer configuration to ensure a consistent development experience.

## Overview

Here will be presented an example of a DevContainer for .NET development with some of the features that are useful for developers. These features include a configured and nice shell, recommended extensions and the default settings to make this a great containerized development experience for .NET.

## Getting Started

### Requirements

You will need a containerization technologies such as Docker, Podman, Kubernetes, etc. to work with devcontainers. We will not explain how to install any of these.

And you will also need VSCode installed.

> :memo: NOTE :memo:
>
> We will not explain how to install any of these in this page.

### How to use it

Using VsCode, you will first need to add the extension pack [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) or minimally the extension [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

From this current folder cloned locally, copy the `.devcontainer` and `.vscode` folder to the root level of your project.

Then, if it is the first time you are working with the project, using the command palette of vscode, find and execute `Dev Container: Build and Open Container`. This will launch the building process of the image locally and then will start the remote process to that new image with your new project inside the container (as a volume to `/workspace/your-project-name`).

After the fisrt launch, you will need to install the recommended vscode extensions (or at least the one you need).

> :warning: WARNING :warning:
>
> If you experience some issue while trying to install some extension, the easiest way to fix this is to use the `Developer: Reload Window` from the command palette and relaunch the extensions that weren't installed.

## Default configurations

- .devcontainer
  - devcontainer.json : the definition of the .NET container that will be hosted the project. There is also an additional powershell feature that will be install to that container. Also all the suggested vscode customization and the recommended extensions are part of the devcontainer configuration.
  - terminal-config.sh : a script that will be executed after the container is created to configure oh-my-posh for bash, zsh and PowerShell using our "[new-rebels](../windows-terminal/config/themes/new-rebels.omp.json)" template.
- .vscode (*in case, you want to run vscode locally without the remote container*)
  - extensions.json : the recommended extensions for vscode
  - settings.json : the suggested settings for vscode
