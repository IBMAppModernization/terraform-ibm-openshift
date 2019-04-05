#!/bin/bash
# Script to enable the Extra Packages for Enterprise Linux (EPEL) repo


rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

sed -i -e "s/^enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo
