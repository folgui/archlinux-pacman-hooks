#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

#DEBUG
#set -x ## Use “set -x” to enable debug mode
#set -e ## Use "set -e" to exit on error
set -u  ## Use "set -u" alway to make sure you won't use any undeclared variable. This saves you from a lot of headaches and critical bugs.

# ============================================================================ #
# @author       : Copyright (c) 202x Jose Miguel Folgueira <a.k.a. folgui>
# @email        : folguidroid@gmail.com
# @web          : http://folgui.synology.me/
# @github       : https://github.com/folgui
# @style        : https://gitlab.com/fryntiz/bash-guide-style
# @license      : https://www.mit.edu/~amini/LICENSE.md
#
# Project Name  :
# Description   :
# Version       :
# ============================================================================ #

user=$(whoami)
userid=$(/usr/bin/id -u "$user")
icon='system-reboot'
urgency='critical'
expiretime=0
title="Reboot recommended!"
summary="Reboot is recommended due to the upgrade of core system package(s)."

cmd=(
    DISPLAY=:0
    DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$userid/bus
    notify-send
    --icon="$icon"
    --urgency="$urgency"
    --expire-time="$expiretime"
    "'$title'"
    "'$summary'"
)
/usr/bin/su "$user" -c "${cmd[*]}"
