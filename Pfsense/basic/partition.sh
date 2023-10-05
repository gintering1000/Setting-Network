#!/bin/sh
sudo gpart destroy -F ada1
sudo gpart create -s gpt ada1

sudo gpart add -t freebsd-ufs -l storage-backup -a 4k -s 1T ada1
sudo gpart add -t freebsd-ufs -l storage-data -a 4k -s 700G ada1
sudo gpart add -t freebsd-ufs -l storage-logging -a 4k -s 100G ada1

sudo newfs /dev/ada1p1
sudo newfs /dev/ada1p2
sudo newfs /dev/ada1p3