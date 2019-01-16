#!/bin/bash
#Welcome to L8nit3s All-In-One shell script
#Made for veil from Mrmetech
#Use of this script is at own risk.
#Tested on ubuntu 14.04/14.10/15.04
#Kali-1.1 and ultimate edition 4.3

usage() {
	echo "---------------------------------------------------------------------------"
	echo "$(tput setaf 2)$(tput setab 7)CRYPTOCOIN FUNCTIONS - RUN AS NORMAL USER$(tput sgr 0)"
	echo "-v=veil (install VEIL)"
	echo "-N=NOMP (install NOMP+VEIL+DEPENDANCIES)"
	echo "---------------------------------------------------------------------------"
}
#Define Functions for options above - Alphabetical
veil() {
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	echo "Now installing veil daemon (command line only)"
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	sleep 2
	sudo apt-get install build-essential libssl-dev libdb5.3-dev libdb5.3++-dev libboost-all-dev git autoconf automake libtool cmake -y
	cd ~/	
	git clone https://github.com/Veil-Project/veil.git
	cd veil
	./autogen.sh
	./configure --with-incompatible-bdb
	make -j 3
	cd ~/veil/src
	sudo cp veild /usr/bin/veild
	sudo cp veil-cli /usr/bin/veil-cli
	cd ~/
	mkdir ~/.veil
	echo rpcuser=veilrpc >> ~/.veil/veil.conf
	echo rpcpassword=InsertSecureP4ssH3r3 >> ~/.veil/veil.conf
	echo listen=1 >> ~/.veil/veil.conf
	echo server=1 >> ~/.veil/veil.conf
	echo daemon=1 >> ~/.veil/veil.conf
	echo rpcport=58810 >> ~/.veil/veil.conf
	echo "Now go into ~/.veil/veil.conf and change rpcuser and rpcpassword"
	echo "then run veil to start wallet"
	ending
}
ending() {
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	echo "Finished executing your options :) Thank you for using Mrmetechs Veil Install script solo pool thing"
	echo "Donate Veil"
	echo "Mining Address : VBxSAoALJbzQ7A9DopwGMajfjhjLUZJfSv"
	echo "Stealth Address : sv1qqpvfmp3xr6xmk6z938nzda3ffpgdg5sma82xar4u7d9atf0f3g6w4cpqd4v02l05yjjh8lnsstvzgsqs6zczezqt6dzed4z6z0n0cvd045g2qqqcwpdu4"
	echo "Basecoin Address : bv1q2xu476x62xl642lw5w9qtuqny7ff80u9qyztqs"	
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
}
nomp() {
	if [[ $EUID -ne 0 ]]; then
		echo "---------------------------------------------------------------------------"
		echo "Installing NOMP+Veil+dependancies"
		echo "---------------------------------------------------------------------------"
		cd ~/
		sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libgmp-dev libminiupnpc-dev libdb5.3-dev libdb5.3++-dev libboost-all-dev git autoconf automake libtool g++ -y
		sudo apt-get install curl -y
		curl --silent --location https://deb.nodesource.com/setup_0.10 | sudo bash -
		sudo apt-get install --yes nodejs
		wget http://download.redis.io/redis-stable.tar.gz
		tar xvzf redis-stable.tar.gz
		cd redis-stable
		make
		sudo make install
		cd ~/
		veil
		read -p "Check that /usr/bin/veil exists, then press enter." -n1 -s
		cd ~/
		echo "---------------------------------------------------------------------------"
		echo "Now Installing NOMP"
		echo "---------------------------------------------------------------------------"
		git clone https://github.com/mrmetech/veil-nomp.git nomp
		cd nomp
		npm update
		echo "---------------------------------------------------------------------------"
		echo "Finished Installing NOMP+REDIS+NODEJS+VEIL"
		echo "Please go to 'https://github.com/mrmetech/veil-node-stratum-pool/'"
		echo "For instructions on editing the config files to suit your needs."
		ending
	else
		echo "---------------------------------------------------------------------------"
		echo "DO NOT RUN THIS OPTION AS SUDO/ROOT, PLEASE RE-RUN AS USER"
		echo "---------------------------------------------------------------------------"
		exit 1
	fi
}

OPTIND=1 # Reset is necessary if getopts was used previously in the script.  It is a good idea to make this local in a function.
while getopts "Skhoausneic1lbAdDwtTNKLXGp?:" opt; do
     case "$opt" in
        h) usage
           exit 0
           ;;
        N) nomp
           exit 0
           ;;
        v) veil
           sleep 3
	   exit 0
	   ;;
        '?')
           usage >&2
           exit 1
           ;;
        '')
           usage >&2
           exit 1
           ;;
    esac
 done
usage
