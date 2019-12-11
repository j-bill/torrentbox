#! /bin/bash

vnstati -s -i eth0 -o /var/www/html/vnstati/summary.png
vnstati -h -i eth0 -o /var/www/html/vnstati/hourly.png
vnstati -d -i eth0 -o /var/www/html/vnstati/daily.png
vnstati -t -i eth0 -o /var/www/html/vnstati/top10.png
vnstati -m -i eth0 -o /var/www/html/vnstati/monthly.png
