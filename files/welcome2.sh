#!/bin/sh
# MOTD
clear
echo
# Date
DATE=`date +"%A, %e %B %Y"`
# Hostname
HOSTNAME=`hostname`
# Last Login
LAST1=`last -2 -a | awk 'NR==2{print $3}'`    # Weekday
LAST2=`last -2 -a | awk 'NR==2{print $5}'`    # Day
LAST3=`last -2 -a | awk 'NR==2{print $4}'`    # Month
LAST4=`last -2 -a | awk 'NR==2{print $6}'`    # Time
LAST5=`last -2 -a | awk 'NR==2{print $10}'`   # Remote Host
# Uptime
UP0=`cut -d. -f1 /proc/uptime`
UP1=$(($UP0/86400))     # Days
UP2=$(($UP0/3600%24))   # Hours
UP3=$(($UP0/60%60))     # Minutes
UP4=$(($UP0%60))        # Seconds
# Average Load
LOAD1=`cat /proc/loadavg | awk '{print $1}'`    # Last Minute
LOAD2=`cat /proc/loadavg | awk '{print $2}'`    # Last 5 Minutes
LOAD3=`cat /proc/loadavg | awk '{print $3}'`    # Last 15 Minutes
# Temperature
TEMP=`vcgencmd measure_temp | cut -c "6-9"`
# HDD Disk Usage
DISK1=`df -h | grep 'dev/sda1' | awk '{print $2}'`    # Total
DISK2=`df -h | grep 'dev/sda1' | awk '{print $3}'`    # Used
DISK3=`df -h | grep 'dev/sda1' | awk '{print $5}'`    # Used%
DISK4=`df -h | grep 'dev/sda1' | awk '{print $4}'`    # Free
# Arbeitsspeicher
RAM1=`free -h --si | grep 'Mem' | awk '{print $2}'`    # Total
RAM2=`free -h --si | grep 'Mem' | awk '{print $3}'`    # Used
RAM3=`free -h --si | grep 'Mem' | awk '{print $4}'`    # Free
RAM4=`free -h --si | grep 'Swap' | awk '{print $3}'`   # Swap used
echo "\033[1;32m   .~~.   .~~.    \033[1;36m$DATE
\033[1;32m  '. \ ' ' / .'   
\033[1;31m   .~ .~~~..~.    \033[0;37mHostname......: \033[1;33m$HOSTNAME
\033[1;31m  : .~.'~'.~. :   \033[0;37mLast Login....: $LAST1, $LAST2 $LAST3 $LAST4 from $LAST5
\033[1;31m ~ (   ) (   ) ~  \033[0;37mUptime........: $UP1 Days, $UP2 Hours, $UP3 Minutes
\033[1;31m( : '~'.~.'~' : ) \033[0;37mØ Usage.......: $LOAD1 (1 min) | $LOAD2 (5 min) | $LOAD3 (15 min)
\033[1;31m ~ .~ (   ) ~. ~  \033[0;37mTemperature...: $TEMP °C
\033[1;31m  (  : '~' :  )   \033[0;37mStorage HDD...: Total: $DISK1 | Used: $DISK2($DISK3) | Free: $DISK4
\033[1;31m   '~ .~~~. ~'    \033[0;37mRAM (MB)......: Total: $RAM1 | Used: $RAM2 | Free: $RAM3 | Swap: $RAM4
\033[1;31m       '~'        \033[0;37
\033[m"
