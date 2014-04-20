#!/usr/bin/env bash

mod.install() {
    ellipsis.link_files "$mod_path/common"

    case "$(ellipsis.platform)" in
        cygwin*)
            ellipsis.link_files "$mod_path/platform/cygwin"
            ;;
        darwin)
            ellipsis.link_files "$mod_path/platform/osx"
            ;;
        freebsd)
            ellipsis.link_files "$mod_path/platform/freebsd"
            ;;
        linux)
            ellipsis.link_files "$mod_path/platform/linux"
            ;;
    esac
}
