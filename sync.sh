#!/bin/bash

declare -A files=( 
    "nvim/init.lua"        "$HOME/.config/nvim/init.lua"
    "nvim/lua/options.lua" "$HOME/.config/nvim/lua/options.lua"
    "nvim/lua/plugins.lua" "$HOME/.config/nvim/lua/plugins.lua"
    "tmux/tmux.conf"       "$HOME/.config/tmux/tmux.conf"
)

for repo_file in "${!files[@]}"; do
    system_file=${files[$repo_file]}

    if [ ! -e "$system_file" ]; then
        echo "$repo_file ->* $system_file"
        cp "$repo_file" "$system_file"
    fi

    repo_file_mod_time=$(stat -c %Y "$repo_file")
    system_file_mod_time=$(stat -c %Y "$system_file")

    if [ "$repo_file_mod_time" -lt "$system_file_mod_time" ]; then
        echo "$repo_file <-- $system_file"
        cp "$system_file" "$repo_file"
    elif [ "$system_file_mod_time" -lt "$repo_file_mod_time" ]; then
        echo "$repo_file --> $system_file"
        cp "$repo_file" "$system_file"
    fi
done
