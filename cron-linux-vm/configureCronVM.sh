#!/bin/bash
yum install epel-release -y
yum install clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd -y
setsebool -P antivirus_can_scan_system 1 && sudo setsebool -P clamd_use_jit 1
cp /etc/clamd.d/scan.conf /etc/clamd.d/scan.conf.backup
sed -i -e "s/^Example/#Example/" /etc/clamd.d/scan.conf
sed -i -e "s/clamscan/root/" /etc/clamd.d/scan.conf
sed -i -e "s/#LocalSocket/LocalSocket/" /etc/clamd.d/scan.conf 
sudo mkdir -p /var/log/clamscan && sudo chmod a+w /var/log/clamscan
crontab -l | { cat; echo "0 23 * * *  /usr/bin/freshclam --quiet  /usr/bin/freshclam --quiet "; } | crontab -
crontab -l | { cat; echo "0 0 * * * /bin/clamscan --infected --remove --recursive --exclude-dir="^/sys" / > /var/log/clamscan/clamscan.`/bin/date +\%Y\%m\%d-\%H\%M\%S`.log "; } | crontab –
