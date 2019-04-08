# http://blog.samat.org/2015/02/05/slimming-an-existing-raspbian-install/
uninstall_unnecessary_packages() {
	echo uninstalling unneccessary packages
	#uninstall gcc-4.7-base
	rm -rf /usr/share/doc/* 
	# transmission will install ca-certificates
	#uninstall ca-certificates
	# uninstalling locales will cause errors
	#uninstall locales
	uninstall manpages
	uninstall man-db
}

uninstall_unused_locales() {
#http://oneofmanyworlds.blogspot.fi/2012/02/debian-wheezy-removing-unused-locales.html
}
