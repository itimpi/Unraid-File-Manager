#!/bin/sh
# Script to copy package files into their final position in the unRAID runtime path.
# This can be run if the plugin is already installed without having to build the
# package or commit any changes to gitHub.   Make testing increments easier.
# (useful during testing)
#
# Copyright 2019, Dave Walker (itimpi).
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation.
#
# Limetech is given expliit permission to use this code in any way they like.
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

PLUGIN="Unraid.FileManager"
echo "copying $PLUGIN files from runtime position to 'source'"
cp -v -r /usr/local/emhttp/$PLUGIN/* source/*  &>/dev/null
date
echo "$PLUGIN files backed up"
