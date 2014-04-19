#!/usr/bin/env bash

mod.install() {
    declare -A deps
    deps[zeekay/vice]=vice
    deps[MarcWeber/vim-addon-manager]=vim-addon-manager

    folders=(vim/addons vim/tmp/backup vim/tmp/undo)

    # backup existing vim file/folders
    ellipsis.backup ~/.vim

    for file in $files; do
        ellipsis.backup ~/.$file
    done

    # create folder structure
    for folder in $folders; do
        mkdir -p ~/.$folder
    done

    # install dependencies
    for dep in ${!deps[@]}; do
        git.clone https://github.com/$dep ~/.vim/addons/${deps[$dep]}
    done

    # link files in place
    for f in $files; do
        ln -s "$mod_path/f" ~/.$f
    done
}

mod.pull() {
    # update deps
    git.pull ~/.vim/addons/vice
    git.pull ~/.vim/addons/vim-addon-manager

    # update installed addons
    for addon in ~/.vim/addons/*; do
        if [ -e "$addon" ]; then
            git.pull "$addon"
        fi
    done
}

mod.status() {
    # status of deps
    git.status ~/.vim/addons/vice
    git.status ~/.vim/addons/vim-addon-manager

    # status of addons
    for addon in ~/.vim/addons/*; do
        if [ -e "$addon" ]; then
            git.status "$addon"
        fi
    done
}
