#! /bin/bash

vnstati -s -i tun0 -o /var/www/html/vnstati/summary.png
vnstati -h -i tun0 -o /var/www/html/vnstati/hourly.png
vnstati -d -i tun0 -o /var/www/html/vnstati/daily.png
vnstati -t -i tun0 -o /var/www/html/vnstati/top10.png
vnstati -m -i tun0 -o /var/www/html/vnstati/monthly.png
