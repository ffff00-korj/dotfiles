#!/bin/bash

build() {
    devcontainer build --workspace-folder . --config ~/.devcontainer/devcontainer.json --no-cache
}

up() {
    devcontainer up --workspace-folder . --config ~/.devcontainer/devcontainer.json
}

exec() {
    devcontainer exec --workspace-folder . --config ~/.devcontainer/devcontainer.json zsh
}

all() {
    build
    up
    exec
}

case "$1" in
    all)
        all
        ;;
    build)
        build
        ;;
    up)
        up
        ;;
    exec)
        exec
        ;;
    *)
        echo "Usage: $0 {all|build|up|exec}"
        exit 1
esac
