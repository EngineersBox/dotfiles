#!/usr/bin/env zsh

function get_provider_icon() {
    local url="$(git remote get-url origin 2>/dev/null)"
    if [ $? -ne 0 ]; then
    return;
    fi
    case "$url" in
    *"github"*) echo "󰊤 " ;;
    *"gitlab"*) echo " " ;;
    *"bitbucket"*) echo "󰂨 ";;
    *"dev.azure.com"*) echo "󰿕 ";;
    *"codecommit"*) echo "󰸏 ";;
    *"codeberg.org"*) echo " ";;
    *) echo "󰊢 ";;
    esac
}

get_provider_icon
