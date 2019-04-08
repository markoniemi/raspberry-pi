initialize_apt_get() {
	echo initializing apt get
	export DEBIAN_FRONTEND=noninteractive
	apt-get -qq update
}

is_installed() {
	if dpkg -l | grep -q $1; then
		return 0
	else
		return 1
	fi
}

# install <package_name>
install() {
	if ! is_installed $1; then
		echo installing $1
		apt-get install -qq -y $1
	else
		echo $1 already installed
	fi
}

# uninstall <package_name>
uninstall() {
	if is_installed $1; then
		echo uninstalling $1
		apt-get remove --purge -qq -y $1
	else
		echo $1 already uninstalled
	fi
}

uninstall_unused_packages() {
	apt-get -qq -y autoremove
}

apt_cleanup() {
	rm -f /var/cache/apt/*cache.bin
	apt-get -qq -y autoclean
	apt-get -qq -y clean
}