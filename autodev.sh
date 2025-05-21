#!/bin/bash

build() {
    devcontainer build --workspace-folder . --config ~/.devcontainer/devcontainer.json
}

up() {
    devcontainer up --workspace-folder . --config ~/.devcontainer/devcontainer.json
}

attach() {
    devcontainer exec --workspace-folder . --config ~/.devcontainer/devcontainer.json zsh
}

launch() {
    build
    up
    attach
}

case "$1" in
    launch)
        launch 
        ;;
    build)
        build
        ;;
    up)
        up
        ;;
    attach)
        attach
        ;;
    *)
        echo "usage: $0 {launch|build|up|attach}"
        exit 1
esac
