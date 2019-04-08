install_dropbear() {
	if ! is_installed dropbear; then
		echo installing dropbear
		#apt-get install dropbear openssh-client
		apt-get install dropbear
		service sshd stop
		sed -i 's/NO_START=1/NO_START=0/' /etc/default/dropbear
		service dropbear restart
	fi
}

uninstall_openssh() {
	echo uninstalling openssh
	apt-get -qq -y purge openssh-server.* openssh-blacklist.*
}

