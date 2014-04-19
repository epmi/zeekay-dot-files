#!/usr/bin/env bash

mod.install() {
    ellipsis.link_files "$mod_path/common"

    case "$(ellipsis.platform)" in
        cygwin*)
            link_files "$mod_path/platform/cygwin"
            ;;
        darwin)
            link_files "$mod_path/platform/osx"
            ;;
        freebsd)
            link_files "$mod_path/platform/freebsd"
            ;;
        linux)
            link_files "$mod_path/platform/linux"
            ;;
    esac
}
