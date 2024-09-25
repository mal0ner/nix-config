#!/usr/bin/env bash

# set -- set shell options
#   -e          -- exit immediately upon fail
#   -u          -- treat unset variables as error
#   -o pipefail -- exit status is last command to exit
#                  with non-zero exit-code, or zero
#                  if all commands exit successfully.
set -eu -o pipefail

# Export machine as variable
uname_out="$(uname -s)"
case "${uname_out}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine=UNKNOWN
esac

if [ "$machine" = "UNKNOWN" ]
then
    echo "Unknown system: $uname_out, exiting..."
    exit 1
fi
export machine "$machine"

if [ "$machine" = "Linux" ]
then
    linux_os_out=$(hostnamectl | grep Operating | cut -d ':' -f2 | awk '{print $1}')
    case "${linux_os_out}" in
        NixOS*)     linux_os=nixos;;
        Ubuntu*)     linux_os=ubuntu;;
        *)          linux_os=UNKNOWN
    esac
    if [ "$linix_os" = "UNKNOWN" ]
    then
        echo "Uknown linux system: $linux_os, exiting..."
        exit 1
    fi
else
    linux_os="none"
fi
export linux_os "$linux_os"
