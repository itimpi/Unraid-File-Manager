#!/usr/bin/php
<?PHP
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
#

// Use .plg file to derive plugin name

$cwd = dirname(__FILE__);
chdir ($cwd);
$files = glob("$cwd/*.plg");
if (empty($files)) {
    echo "ERROR:  Unable to find any .plg files in current directory\n";
    exit(1);
} elseif (count($files) != 1 ) {
    echo "ERROR;  More than 1 .plg file in current directory\n";
    echo $files;
    exit(1);
} else {
    $plugin = preg_replace('/\\.[^.\\s]{3,4}$/', '', basename($files[0]));;
    echo "\nPLUGIN: $plugin\n";
}

// Check that the plugin has actually been installed
// If not create its working folder on the flash drive

if (!is_dir("/boot/config/plugins/$plugin")) {
    echo "\nERROR: $plugin is not currently installed\n";
    exit (-1);
}


echo "copying files from 'source' to runtime position\n";
system ("cp -v -r -u source/* /");
system ("chown -R root /usr/local/emhttp/plugins/$plugin/*");
system ("chgrp -R root /usr/local/emhttp/plugins/$plugin/*");
system ("chmod -R 755 /usr/local/emhttp/plugins/$plugin/*");
system ("date");
echo "files copied\n\n";
?>
