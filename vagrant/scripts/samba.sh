install_samba() {
	if ! is_installed samba; then
		install samba
		# edit config
		#set_property /etc/samba/smb.conf workgroup NIEMI 
		#sed -i 's/#   wins support = no/wins support = yes/g' /etc/samba/smb.conf
		yes | cp -rf $config_dir/samba /etc/
	fi
}
