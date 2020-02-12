#!/bin/bash

ping -c 2 google.com > /dev/tty
if [ $? -ne 0 ]; then
  service openvpn stop
  service openvpn start
fi
