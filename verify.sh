#!/bin/bash
echo "########## Hostname ###########"
hostname
echo ""

echo "########## CPU Load ###########"
vmstat -w -S K 5 5
echo ""

echo "########## Load Average #######"
cat /proc/loadavg
echo ""

echo "########## Memory Usage ##########"
free -h
echo ""

echo "########## Disk Usage  ##########"
df -h -x tmpfs | awk '+$5>=70 || +$5>=90'
echo ""

echo "########## Enable Service ##########"
systemctl list-unit-files --state enabled | grep "systemd-journald\|NetworkManager\|auditd"
echo ""

echo "########## Running Service ##########"
systemctl list-units --type service --state running | grep "systemd-journald\|NetworkManager\|auditd"