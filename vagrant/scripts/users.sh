add_user() {
	ret=false
	getent passwd $1 >/dev/null 2>&1 && ret=true
	
	if $ret; then
	    echo user $1 exists
	else
	    echo adding user $1
	    if [ -z "$2" ]; then
	    	additionalGroup=""
    	else
	    	additionalGroup=$2
    	fi
		groupadd $1
		useradd $1 -s /bin/bash -m -g $1 -G $1,$2
		# echo "$1"|passwd --stdin $1
		#echo $1:$1 | chpasswd
		usermod -p $(echo $1 | openssl passwd -1 -stdin) $1
		#echo "$1        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/$1
		#chmod 0440 /etc/sudoers.d/$1
		adduser $1 sudo
	fi
}
