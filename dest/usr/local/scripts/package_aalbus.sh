#!/bin/mksh

bsdtar cvjf /usr/local/package_output/aalbus-amd64-musl-clang-`date +%d-%m-%Y`.tar.bz2 \
--xattrs \
--exclude="/root/*" \
--exclude="/mnt/*" \
--exclude="/run/*" \
--exclude="/tmp/*" \
--exclude="/proc/*" \
--exclude="/sys/*" \
--exclude="/dev/*" \
--exclude="/include/*" \
--exclude="/lib/*" \
--exclude="/usr/man/*" \
--exclude="/usr/etc/*" \
--exclude="/usr/pkgsrc/*" \
--exclude="/usr/src/*" \
--exclude="/var/cache/*" \
--exclude="/var/obj/*" \
--exclude="/usr/pkg/*" \
--exclude="/etc/pkg/openssl/*" \
--exclude="/etc/ssh/ssh_host_*" \
--exclude="/etc/resolv.conf" \
--exclude="/usr/local/package_output/*" \
/

chmod 777 /usr/local/package_output/*.tar.bz2



