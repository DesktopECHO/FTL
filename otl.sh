#!/bin/bash
# otl.sh - Build script for pihole-FTL on CentOS 7
#
# This file is copyright under the latest version of the EUPL.
# Please see LICENSE file for your rights under this license.

cd /tmp
rm -rf FTL
git clone --depth=1 https://github.com/DesktopECHO/FTL.git
sudo yum -y install scl-utils policycoreutils-python python3-pip python-IPy nettle-devel libidn-devel readline-devel /tmp/FTL/el7/*.rpm
cd /tmp/FTL
scl enable devtoolset-7 ./build.sh
service pihole-FTL stop
/bin/cp pihole-FTL /usr/bin/pihole-FTL
service pihole-FTL start
