#!/bin/bash

ping -c 2 google.com > /dev/tty
if [ $? -ne 0 ]; then
  systemctl restart openvpn
fi
