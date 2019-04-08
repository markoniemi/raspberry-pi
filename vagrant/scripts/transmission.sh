install_transmission() {
	if ! is_installed transmission-daemon; then
		echo installing transmission
		uninstall libssl1.0.0 
		install libssl1.0.0 
		install transmission-daemon
		# edit config
		yes | cp -rf $config_dir/transmission-daemon /etc/
		chmod a+w /home/pi
		#set_json_property /etc/transmission-daemon/settings.json rpc-whitelist-enabled false 
		#set_json_property /etc/transmission-daemon/settings.json rpc-authentication-required false 
		#sed -i 's/"rpc-authentication-required": true,/"rpc-authentication-required": false,/g' /etc/transmission-daemon/settings.json
	fi
}
