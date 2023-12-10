#!/bin/bash

dpkg -i /opt/debian/ubuntu-build-service/packages/*

apt-get install -y -f

ln -s /usr/bin/python3 /usr/bin/python

export FORCE_UNSAFE_CONFIGURE=1

sed -i '1161s%umount%#umount%' /usr/share/debootstrap/functions

bash
