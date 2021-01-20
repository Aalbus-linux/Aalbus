#!/bin/mksh

bsdtar cvJf /usr/local/package_output/aalbus-amd64-musl-clang-`date +%d-%m-%Y`.tar.xz \
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
--exclude="/usr/src/*" \
--exclude="/var/cache/*" \
--exclude="/var/obj/*" \
--exclude="/usr/pkg/pkg-distfiles/*" \
--exclude="/etc/pkg/openssl/*" \
--exclude="/etc/ssh/ssh_host_*" \
--exclude="/usr/local/package_output/*" \
/

chmod 777 /usr/local/package_output/*.tar.xz



