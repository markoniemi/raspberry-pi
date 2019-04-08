#!/usr/bin/env bash
download_dir=/home/vagrant/download
script_dir=/vagrant/scripts
config_dir=/vagrant/config

source $script_dir/sed.sh
source $script_dir/apt-get.sh
source $script_dir/users.sh
source $script_dir/firewall.sh
source $script_dir/service.sh
source $script_dir/time.sh
source $script_dir/transmission.sh
source $script_dir/samba.sh
source $script_dir/slim-raspbian.sh
source $script_dir/dropbear.sh

#copy config to config_dir
#yes | cp -r /vagrant/ $config_dir/

# http://www.htpcguides.com/lightweight-raspbian-distro-minibian-initial-setup/
# http://www.richardsramblings.com/2013/02/minimalist-raspberry-pi-server-image/
# http://raspberrypi.stackexchange.com/questions/499/how-can-i-resize-my-root-partition
# TODO add docker and docker-compose
# https://manre-universe.net/how-to-run-docker-and-docker-compose-on-raspbian/
provision() {
	yes | cp -rf $config_dir/boot /
	initialize_apt_get
	uninstall_unnecessary_packages
	set_timezone
#	disable_firewall
#	install nano
	remove_apt_cache
	remove_memory_swap

 	install_transmission
 	install_samba
 	install_dropbear
 	uninstall_openssh
	uninstall_unused_packages

 	add_user niemimac debian-transmission
 	add_user pi debian-transmission

	# start services
 	echo start samba service
 	service samba restart
 	echo start transmission service
 	service transmission-daemon reload
	
	apt_cleanup	
}

remove_memory_swap() {
	echo removing memory swap
	swapoff -a
	apt-get purge dphys-swapfile
	rm /var/swap
}

remove_apt_cache() {
	echo removing apt cache
	echo "Dir::Cache {srcpkgcache "";pkgcache "";}" > /etc/apt/apt.conf.d/02_nocache
}
