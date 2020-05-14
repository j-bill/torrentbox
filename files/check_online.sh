#!/bin/bash

ping -c 2 google.com > /dev/null
if [ $? -ne 0 ]; then
  systemctl restart openvpn
  echo "<p> `date` Connection Lost</p>" >> /var/www/html/vnstati/index.html
fi