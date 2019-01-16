#!/bin/bash
#Welcome to L8nit3s All-In-One shell script
#Use of this script is at own risk.
#Tested on ubuntu 14.04/14.10/15.04
#Kali-1.1 and ultimate edition 4.3

usage() {
	echo "---------------------------------------------------------------------------"
	echo "$(tput setaf 1)$(tput setab 7)Hello and welcome to L8nit3's All-In-One shell script.$(tput sgr 0)"
	echo "---------------------------------------------------------------------------"
	echo "$(tput setaf 2)$(tput setab 7)BASIC FUNCTIONS - RUN WITH SUDO$(tput sgr 0)"
	echo "-h or ?=Display this help screen"
	echo "-i=Install this script (to /usr/bin, just type 'AIO' or 'aio' when done.)"
	echo "$(tput setaf 2)$(tput setab 7)UPDATE FUNCTIONS - RUN WITH SUDO$(tput sgr 0)"
	echo "-u=Update entire system (update+upgrade+dist-upgrade+autoremove+apt clean)"
	echo "-s=Small Update (just apt update and upgrade)"
	echo "$(tput setaf 2)$(tput setab 7)DESKTOP ENVIRONMENT CHANGING- RUN WITH SUDO$(tput sgr 0)"
	echo "-K=KDE (install kde alongside unity)"
	echo "-X=XFCE (install xfce alongside unity)"
	echo "-L=LXDE (install lxde alongside unity)"
	echo "-G=GNOME (jinstall gnome alongside unity)"
	echo "$(tput setaf 2)$(tput setab 7)CRYPTOCOIN FUNCTIONS - RUN AS NORMAL USER$(tput sgr 0)"
	echo "-l=ltc (install litecoin daemon)"
	echo "-d=dash (install dashcoin daemon)"
	echo "-N=NOMP (install NOMP+LTC+DASH+DEPENDANCIES)"
	echo "-o=NOMP only (install NOMP+DEPENDANCIES no coins)"
	echo "-c=cgminer4.3.5 (install ZEUS/GRIDSEED cgminer)"
	echo "-A=AllCoins (Install 42,dash,ltc,nyan,sxc,zeta+NOMP)"
	echo "-a=allCoinNOnomp (Install 42,dash,ltc,nyan,sxc,zeta)"
	echo "$(tput setaf 2)$(tput setab 7)NETWORK FUNCTIONS RUN WITH SUDO$(tput sgr 0)"
	echo "-w=wifite (install wifite+reaver+pyrit+tshark+aircrack)"
	echo "-S=sqlmap (install sqlmap)"
	echo "-n=Network (install tightvnc+openssh-server+screen)"
	echo "-t=teamviewer32 (install Teamviewer i386 edition)"
	echo "-T=teamviewer64 (install Teamviewer amd64 edition)"
	echo "$(tput setaf 2)$(tput setab 7)MEDIA FUNCTION - RUN WITH SUDO$(tput sgr 0)"
	echo "-k=kodi (install kodi/xbmc)"
	echo "$(tput setaf 2)$(tput setab 7)GAMING EMULATION FUNCTIONS - RUN WITH SUDO$(tput sgr 0)"
	echo "-e=emuFull (install 16 console emulators)"
	echo "$(tput setaf 2)$(tput setab 7)ANDROID DEV FUNCTIONS$(tput sgr 0)"
	echo "-p=AOSP (Download and install Android AOSP and requirements)"
	echo "---------------------------------------------------------------------------"
	echo "$(tput setaf 1)$(tput setab 7)example: sudo AIO -i && aio -A$(tput sgr 0)"
	echo "Will install AIO to /usr/bin and then add NOMP+6 cryptocoins."
	echo "---------------------------------------------------------------------------"
}
#Define Functions for options above - Alphabetical
allcoinNOnomp() {
	if [[ $EUID -ne 0 ]]; then
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	echo "Now installing all supported coin daemons (command line only)"
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	sleep 2
	sudo apt-get install build-essential libssl-dev libdb5.3-dev libdb5.3++-dev libboost-all-dev git autoconf automake libtool cmake -y
	cd ~/
	mkdir wallets
	cd wallets
	ltc
	mv litecoin wallets
	dash
	mv dash wallets
	fourty2
	mv 42 wallets
	nyan
	mv nyancoin wallets
	sexcoin
	mv sexcoin wallets
	zetacoin
	mv zetacoin wallets
	echo "---------------------------------------------------------------------------"
	echo "Finished installing 42, dash, ltc, nyan, sxc, and zet."
	echo "---------------------------------------------------------------------------"
	ending
	else
		echo "---------------------------------------------------------------------------"
		echo "DO NOT RUN THIS OPTION AS SUDO/ROOT, PLEASE RE-RUN AS USER"
		echo "---------------------------------------------------------------------------"
		exit 1
	fi
}
allcoins() {
	if [[ $EUID -ne 0 ]]; then
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	echo "Now installing all supported coin daemons (command line only)"
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	sleep 2
	sudo apt-get install build-essential libssl-dev libdb5.3-dev libdb5.3++-dev libboost-all-dev git autoconf automake libtool cmake -y
	cd ~/
	mkdir wallets
	cd wallets
	ltc
	mv litecoin wallets
	dash
	mv dash wallets
	fourty2
	mv 42 wallets
	nyan
	mv nyancoin wallets
	sexcoin
	mv sexcoin wallets
	zetacoin
	mv zetacoin wallets
	nomp1
	echo "---------------------------------------------------------------------------"
	echo "Finished installing 42, dash, ltc, nyan, sxc, and zet. Now adding NOMP."
	echo "---------------------------------------------------------------------------"

	else
		echo "---------------------------------------------------------------------------"
		echo "DO NOT RUN THIS OPTION AS SUDO/ROOT, PLEASE RE-RUN AS USER"
		echo "---------------------------------------------------------------------------"
		exit 1
	fi
}
aosp() {
	if [[ $EUID -ne 0 ]]; then
		sudo chmod +x aosp-install
		./aosp-install
	else
		echo "Please run as normal user, you will be prompted for root when needed." 2>&1
  		exit 1

	fi
}
cgminer() {
	if [[ $EUID -ne 0 ]]; then
		echo "---------------------------------------------------------------------------"
		echo "You used -c, now installing cgminer 4.3.5 ZEUS/GRIDSEED + DEPENDANCIES"
		echo "---------------------------------------------------------------------------"
		sudo apt-get install libcurl4-openssl-dev pkg-config libtool libncurses5-dev libudev-dev screen xterm git openssh-server autoconf automake -y
		cd ~/		
		git clone https://github.com/dmaxl/cgminer.git
		cd cgminer
		./autogen.sh
		./configure --enable-scrypt --enable-zeus --enable-gridseed
		make
		chmod 777 cgminer
		sudo cp cgminer /usr/bin
		echo "#cgminer setup for zeus blizzard only" >> miner
		echo "#cgminer --scrypt --zeus-chips 6 --zeus-clock 328 --scan-serial zeus:auto -o stratum+tcp://multi.ghash.io:3333 -O up100190575.scrypt:x" >> miner
		echo "" >> miner
		echo "#cgminer setup for gridseed globe only" >> miner
		echo "#cgminer --scrypt --gridseed-options=baud=115200,freq=900,chips=5 -o stratum+tcp://multi.ghash.io:3333 -O up100190575.scrypt:x" >> miner
		echo "" >> miner
		echo "#cgminer setup for zeus blizzard and gridseed globe" >> miner
		echo "#cgminer --scrypt --zeus-chips 6 --zeus-clock 328 --scan-serial zeus:auto --gridseed-options=baud=115200,freq=900,chips=5 -o stratum+tcp://multi.ghash.io:3333 -O up100190575.scrypt:x" >> miner
		chmod 777 miner
		mv miner ~/Desktop
		echo "---------------------------------------------------------------------------"
		echo "Finished installing, edit 'miner' file on desktop, uncommenting your"
		echo "required configuration. Then run 'cd ~/Desktop && sudo ./miner' from"
		echo "a command terminal to start miner"
		echo "---------------------------------------------------------------------------"

	else
		echo "Please run as normal user, you will be prompted for root when needed." 2>&1
  		exit 1

	fi
}
dash() {
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	echo "Now installing dashcoin daemon (command line only)"
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	sleep 2
	sudo apt-get install build-essential libssl-dev libdb5.3-dev libdb5.3++-dev libboost-all-dev git autoconf automake libtool cmake -y
	cd ~/	
	git clone https://github.com/dashpay/dash.git
	cd dash
	./autogen.sh
	./configure --with-incompatible-bdb
	make -j 3
	cd ~/dash/src
	sudo cp dashd /usr/bin/dashcoin
	sudo cp dash-cli /usr/bin/dashcoin-cli
	cd ~/
	mkdir ~/.dash
	echo rpcuser=dashcoinrpc >> ~/.dash/dash.conf
	echo rpcpassword=InsertSecureP4ssH3r3 >> ~/.dash/dash.conf
	echo listen=1 >> ~/.dash/dash.conf
	echo server=1 >> ~/.dash/dash.conf
	echo daemon=1 >> ~/.dash/dash.conf
	echo rpcport=9998 >> ~/.dash/dash.conf
	echo "Now go into ~/.dash/dash.conf and change rpcuser and rpcpassword"
	echo "then run dashcoin to start wallet"
	ending
}
emuFull() {
	if [[ $EUID -ne 0 ]]; then
		echo "For this option, Please run as root/sudo" 2>&1
  		exit 1
	else
		apt-get -y update
		apt-get -y install mame mess zsnes:i386 visualboyadvance visualboyadvance-gtk stella mednafen fceu desmume mupen64plus yabause
		ending
	fi
}
ending() {
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	echo "Finished executing your options :) Thank you for using l8nit3's AIO"
	echo "Suggestions/comments? email to l8nit3@outlook.com"
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
}
fourty2() {
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	echo "Now installing 42coin daemon (command line only)"
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	sleep 2
	sudo apt-get install build-essential libssl-dev libdb5.3-dev libdb5.3++-dev libminiupnpc-dev libboost-all-dev git autoconf automake libtool -y
	cd ~/
	git clone https://github.com/fourtytwo42/42.git
	cd 42/src
	make -f makefile.unix -j 3
	sudo cp 42 /usr/bin
	cd ~/
	mkdir ~/.42
	echo rpcuser=42rpc >> ~/.42/42.conf
	echo rpcpassword=InsertSecureP4ssH3r3 >> ~/.42/42.conf
	echo listen=1 >> ~/.42/42.conf
	echo server=1 >> ~/.42/42.conf
	echo daemon=1 >> ~/.42/42.conf
	echo rpcport=4242 >> ~/.42/42.conf
	echo "Now go into ~/.42/42.conf and add your username and password"
	echo "then run 42 to start wallet"
	ending
}
GNOME() {
	if [[ $EUID -ne 0 ]]; then
		echo "For this option, Please run as root/sudo" 2>&1
  		exit 1
	else
		echo "---------------------------------------------------------------------------"
		echo "Installing GNOME DESKTOP."
		echo "---------------------------------------------------------------------------"
		apt-get install ubuntu-gnome-desktop -y
		ending
        fi
}
inst() {
	if [[ $EUID -ne 0 ]]; then
		echo "For this option, Please run as root/sudo" 2>&1
  		exit 1
	else
		echo "---------------------------------------------------------------------------"
		echo "You used -i, Now INSTALLING SCRIPT (to /usr/bin)"
		echo "if there are errors, be sure you cd to the same"
		echo "directory as the 'AIO' script"
		echo "---------------------------------------------------------------------------"
		sleep 2
		cp AIO /usr/bin
		cp AIO /usr/bin/aio
		chmod 777 /usr/bin/AIO /usr/bin/aio
		ending
	fi
}
KDE() {
	if [[ $EUID -ne 0 ]]; then
		echo "For this option, Please run as root/sudo" 2>&1
  		exit 1
	else
		echo "---------------------------------------------------------------------------"
		echo "Installing KDE DESKTOP."
		echo "---------------------------------------------------------------------------"
		apt-get install kubuntu-desktop software-properties-kde -y
		ending
        fi
}
kodi() {
		echo "---------------------------------------------------------------------------"
		echo "Installing kodi/xbmc newest version."
		echo "---------------------------------------------------------------------------"
	if [[ $EUID -ne 0 ]]; then
		echo "For this option, Please run as root/sudo" 2>&1
  		exit 1
	else
		apt-get install software-properties-common -y
		add-apt-repository ppa:team-xbmc/ppa -y
		apt-get update
		apt-get install kodi -y
		ending
fi
}
ltc() {
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	echo "Now installing litecoin daemon (command line only)"
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	sleep 2
	sudo apt-get install build-essential libssl-dev libdb5.3-dev libdb5.3++-dev libboost-all-dev git autoconf automake libtool -y
	cd ~/
	git clone git://github.com/litecoin-project/litecoin.git
	cd litecoin
	./autogen.sh
	./configure --with-incompatible-bdb
	make -j 3
	cd ~/litecoin/src
	sudo cp litecoind /usr/bin/litecoin
	sudo cp litecoin-cli /usr/bin/litecoin-cli
	cd ~/
	mkdir ~/.litecoin
	echo rpcuser=litecoinrpc >> ~/.litecoin/litecoin.conf
	echo rpcpassword=InsertSecureP4ssH3r3 >> ~/.litecoin/litecoin.conf
	echo listen=1 >> ~/.litecoin/litecoin.conf
	echo server=1 >> ~/.litecoin/litecoin.conf
	echo daemon=1 >> ~/.litecoin/litecoin.conf
	echo rpcport=9332 >> ~/.litecoin/litecoin.conf
	echo "Now go into ~/.litecoin/litecoin.conf and add your username and password"
	echo "then run litecoin to start wallet"
	ending
}
LXDE() {
	if [[ $EUID -ne 0 ]]; then
		echo "For this option, Please run as root/sudo" 2>&1
  		exit 1
	else
		echo "---------------------------------------------------------------------------"
		echo "Installing LXDE DESKTOP."
		echo "---------------------------------------------------------------------------"
		apt-get install lubuntu-desktop -y
		ending
        fi
}
network () {
	if [[ $EUID -ne 0 ]]; then
		echo "For this option, Please run as root/sudo" 2>&1
  		exit 1
	else
		echo "---------------------------------------------------------------------------"
		echo "---------------------------------------------------------------------------"
		echo "Installing basic remote networking tools."
		echo "---------------------------------------------------------------------------"
		echo "---------------------------------------------------------------------------"
		apt-get install tightvnc openssh-server screen -y
		echo "---------------------------------------------------------------------------"
		echo "---------------------------------------------------------------------------"
		echo "All finished adding remote networking tools."
		echo "---------------------------------------------------------------------------"
		echo "---------------------------------------------------------------------------"
	fi
}
nomp() {
	if [[ $EUID -ne 0 ]]; then
		echo "---------------------------------------------------------------------------"
		echo "Installing NOMP+LTC+DASH+dependancies"
		echo "---------------------------------------------------------------------------"
		cd ~/
		sudo apt-get install build-essential libssl-dev libminiupnpc-dev libdb5.3-dev libdb5.3++-dev libboost-all-dev git autoconf automake libtool g++ -y
		sudo apt-get install curl -y
		curl --silent --location https://deb.nodesource.com/setup_0.10 | sudo bash -
		sudo apt-get install --yes nodejs
		wget http://download.redis.io/redis-stable.tar.gz
		tar xvzf redis-stable.tar.gz
		cd redis-stable
		make
		sudo make install
		cd ~/
		ltc
		read -p "Check that /usr/bin/litecoin exists, then press enter." -n1 -s
		dash
		read -p "Check that /usr/bin/dashcoind exists, the press enter" -n1 -s
		cd ~/
		echo "---------------------------------------------------------------------------"
		echo "Now Installing NOMP"
		echo "---------------------------------------------------------------------------"
		git clone https://github.com/zone117x/node-open-mining-portal.git nomp
		cd nomp
		npm update
		echo "---------------------------------------------------------------------------"
		echo "Finished Installing NOMP+REDIS+NODEJS+DASH+LTC"
		echo "Please go to 'https://github.com/zone117x/node-open-mining-portal'"
		echo "For instructions on editing the config files to suit your needs."
		ending
	else
		echo "---------------------------------------------------------------------------"
		echo "DO NOT RUN THIS OPTION AS SUDO/ROOT, PLEASE RE-RUN AS USER"
		echo "---------------------------------------------------------------------------"
		exit 1
	fi
}
nomp1() {
	if [[ $EUID -ne 0 ]]; then
		echo "---------------------------------------------------------------------------"
		echo "Installing NOMP+dependancies"
		echo "---------------------------------------------------------------------------"
		cd ~/
		sudo apt-get install build-essential libssl-dev libminiupnpc-dev libdb5.3-dev libdb5.3++-dev libboost-all-dev git autoconf automake libtool g++ -y
		sudo apt-get install curl -y
		curl --silent --location https://deb.nodesource.com/setup_0.10 | sudo bash -
		sudo apt-get install --yes nodejs
		wget http://download.redis.io/redis-stable.tar.gz
		tar xvzf redis-stable.tar.gz
		cd redis-stable
		make
		sudo make install
		cd ~/
		echo "---------------------------------------------------------------------------"
		echo "Now Installing NOMP"
		echo "---------------------------------------------------------------------------"
		git clone https://github.com/zone117x/node-open-mining-portal.git nomp
		cd nomp
		npm update
		echo "---------------------------------------------------------------------------"
		echo "Finished Installing NOMP+REDIS+NODEJS+DASH+LTC"
		echo "Please go to 'https://github.com/zone117x/node-open-mining-portal'"
		echo "For instructions on editing the config files to suit your needs."
		ending
	else
		echo "---------------------------------------------------------------------------"
		echo "DO NOT RUN THIS OPTION AS SUDO/ROOT, PLEASE RE-RUN AS USER"
		echo "---------------------------------------------------------------------------"
		exit 1
	fi
}
nyan() {
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	echo "Now installing nyancoin daemon (command line only)"
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	sleep 2
	sudo apt-get install build-essential libssl-dev libminiupnpc-dev libdb5.3-dev libdb5.3++-dev libboost-all-dev git autoconf automake libtool -y
	cd ~/
	git clone https://github.com/nyancoin-release/nyancoin.git
	cd nyancoin/src
	make -f makefile.unix -j 3
	sudo cp nyancoind /usr/bin/nyancoin
	cd ~/
	mkdir ~/.nyancoin
	echo rpcuser=nyancoinrpc >> ~/.nyancoin/nyancoin.conf
	echo rpcpassword=InsertSecureP4ssH3r3 >> ~/.nyancoin/nyancoin.conf
	echo listen=1 >> ~/.nyancoin/nyancoin.conf
	echo server=1 >> ~/.nyancoin/nyancoin.conf
	echo daemon=1 >> ~/.nyancoin/nyancoin.conf
	echo rpcport=33700 >> ~/.nyancoin/nyancoin.conf
	echo "Now go into ~/.nyancoin/nyancoin.conf and add your username and password"
	echo "then run nyancoin to start wallet"
	ending
}
sexcoin() {
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	echo "Now installing sexcoin daemon (command line only)"
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	sleep 2
	sudo apt-get install build-essential libminiupnpc-dev libssl-dev libdb5.3-dev libdb5.3++-dev libboost-all-dev git autoconf automake libtool -y
	cd ~/
	git clone https://github.com/sexcoin-project/sexcoin.git
	cd sexcoin/src
	make -f makefile.unix -j 3
	cd ~/sexcoin/src
	sudo cp sexcoind /usr/bin/sexcoin
	cd ~/
	mkdir ~/.sexcoin
	echo rpcuser=sexrpc >> ~/.sexcoin/sexcoin.conf
	echo rpcpassword=InsertSecureP4ssH3r3 >> ~/.sexcoin/sexcoin.conf
	echo listen=1 >> ~/.sexcoin/sexcoin.conf
	echo server=1 >> ~/.sexcoin/sexcoin.conf
	echo daemon=1 >> ~/.sexcoin/sexcoin.conf
	echo rpcport=9561 >> ~/.sexcoin/sexcoin.conf
	echo "Now go into ~/.sexcoin/sexcoin.conf and add your username and password"
	echo "then run sexcoin to start wallet"
	ending
}
smallupdate() {
	if [[ $EUID -ne 0 ]]; then
		echo "For this option, Please run as root/sudo" 2>&1
  		exit 1
	else
		echo "---------------------------------------------------------------------------"
		echo "You have used -su, now running SMALL UPDATE"
		echo "---------------------------------------------------------------------------"
		sleep 2
		apt-get update
		apt-get -y upgrade
		ending
	fi
}
sql() {
		echo "---------------------------------------------------------------------------"
		echo "Installing SQL pentest software.."
		echo "---------------------------------------------------------------------------"
	if [[ $EUID -ne 0 ]]; then
		echo "For this option, Please run as root/sudo" 2>&1
  		exit 1
	else
	cd ~/myscripts
	tar -xvf sqlmap.tar.gz -C ~/
	cd ~/sqlmap
	echo "cd ~/sqlmap && python sqlmap.py --wizard" >> sqlmap
	chmod 777 sqlmap
	cp sqlmap /usr/bin
	cd ~/Desktop/myscripts
	rm -r sqlmap*
fi
}
teamviewer32 () {
	if [[ $EUID -ne 0 ]]; then
		echo "For this option, Please run as root/sudo" 2>&1
  		exit 1
	else
		echo "---------------------------------------------------------------------------"
		echo "Installing teamviewer i386 version."
		echo "---------------------------------------------------------------------------"
		cd ~/
		wget http://download.teamviewer.com/download/teamviewer_i386.deb
		dpkg -i teamviewer*.deb
		apt-get install -f -y
		ending

fi
}
teamviewer64 () {
	if [[ $EUID -ne 0 ]]; then
		echo "For this option, Please run as root/sudo" 2>&1
  		exit 1
	else
		echo "---------------------------------------------------------------------------"
		echo "Installing teamviewer amd64 version."
		echo "---------------------------------------------------------------------------"
		cd ~/
		wget http://download.teamviewer.com/download/teamviewer_amd64.deb
		apt-get install -y lib32z1 libc-dev-bin libc6 libc6-dbg libc6-dev libc6-i386
		dpkg -i teamviewer*.deb
		ending
fi
}
update() {
	if [[ $EUID -ne 0 ]]; then
		echo "For this option, Please run as root/sudo" 2>&1
  		exit 1
	else
		echo "---------------------------------------------------------------------------"
		echo "You used -u, now running FULL UPDATE"
		echo "---------------------------------------------------------------------------"
		sleep 2
		apt-get update
		apt-get -y upgrade
		apt-get -y dist-upgrade
		apt-get -f -y install
		apt-get -y autoremove
		apt-get clean
		ending
	fi
}
wifite() {
	if [[ $EUID -ne 0 ]]; then
		echo "For this option, Please run as root/sudo" 2>&1
  		exit 1
	else
		echo "---------------------------------------------------------------------------"
		echo "---------------------------------------------------------------------------"
		echo "Now installing Fern-Wifi-Cracker-NG."
		echo "---------------------------------------------------------------------------"
		echo "---------------------------------------------------------------------------"
		cd ~/
		git clone https://github.com/savio-code/fern-wifi-cracker.git fern
		cd fern
		echo "cd ~/fern/Fern-Wifi-Cracker && sudo python execute.py" >> fern
		chmod 777 fern
		sudo cp fern /usr/bin
		echo "---------------------------------------------------------------------------"
		echo "Finished installing Fern-Wifi-Cracker."
		echo "---------------------------------------------------------------------------"
		echo "---------------------------------------------------------------------------"
		echo "Now installing Wifite Wifi Cracker."
		echo "---------------------------------------------------------------------------"
		echo "---------------------------------------------------------------------------"
		cd ~/
		mkdir wifite
		cd wifite
		echo "---------------------------------------------------------------------------"
		echo "Now installing Wifite Depenancies."
		echo "---------------------------------------------------------------------------"
		apt-get install -y aircrack-ng libpcap-dev sqlite3 libsqlite3-dev libpcap0.8-dev tshark pyrit wireshark libssl-dev libdigest-hmac-perl macchanger
		echo "---------------------------------------------------------------------------"
		echo "Now installing/compiling reaver."
		echo "---------------------------------------------------------------------------"
		wget http://reaver-wps.googlecode.com/files/reaver-1.4.tar.gz
		tar xzvf reaver-1.4.tar.gz
		cd reaver-1.4/src
		./configure && make && make install
		echo "---------------------------------------------------------------------------"
		echo "Now installing Cowpatty"
		echo "---------------------------------------------------------------------------"
		wget http://www.willhackforsushi.com/code/cowpatty/4.6/cowpatty-4.6.tgz
		tar xvf cowpatty-4.6.tgz
		mv cowpatty-4.6 cowpatty
		cd cowpatty
		make
		make install
		echo "---------------------------------------------------------------------------"
		echo "Now Downloading wifite."
		echo "---------------------------------------------------------------------------"
		cd ~/wifite
		wget -O wifite.py http://wifite.googlecode.com/svn/trunk/wifite.py
		chmod +x wifite.py
		echo "---------------------------------------------------------------------------"
		echo "Now creating launcher file for easy use."
		echo "---------------------------------------------------------------------------"
		echo "cd ~/wifite && python wifite.py --wep --wept 500000 --wpa --wpat 500000" > ~/wifite/wifite
		cd ~/wifite
		chmod +x wifite
		chmod 777 ~/wifite
		cp wifite /usr/bin
		echo "---------------------------------------------------------------------------"
		echo "---------------------------------------------------------------------------"
		echo "Wifite should now be installed, test by typing sudo wifite"
		echo "---------------------------------------------------------------------------"
		echo "---------------------------------------------------------------------------"
		ending
	fi
}
XFCE() {
	if [[ $EUID -ne 0 ]]; then
		echo "For this option, Please run as root/sudo" 2>&1
  		exit 1
	else
		echo "---------------------------------------------------------------------------"
		echo "Installing XFCE DESKTOP."
		echo "---------------------------------------------------------------------------"
		apt-get install xfce4 xfce4-goodies -y
		ending
        fi
}
zetacoin() {
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	echo "Now installing zetacoin daemon (command line only)"
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	sleep 2
	sudo apt-get install build-essential libssl-dev libdb5.3-dev libdb5.3++-dev libboost-all-dev git autoconf automake libtool libminiupnp-devc -y
	cd ~/
	git clone https://github.com/zetacoin/zetacoin.git
	cd zetacoin
	./autogen.sh
	./configure --with-incompatible-bdb
	make -j 3
	cd ~/zetacoin/src
	sudo cp zetacoind /usr/bin/zetacoin
	cd ~/
	mkdir ~/.zetacoin
	echo rpcuser=zetarpc >> ~/.zetacoin/zetacoin.conf
	echo rpcpassword=InsertSecureP4ssH3r3 >> ~/.zetacoin/zetacoin.conf
	echo listen=1 >> ~/.zetacoin/zetacoin.conf
	echo server=1 >> ~/.zetacoin/zetacoin.conf
	echo daemon=1 >> ~/.zetacoin/zetacoin.conf
	echo rpcport=17333 >> ~/.zetacoin/zetacoin.conf
	echo "Now go into ~/.zetacoin/zetacoin.conf and add your username and password"
	echo "then run zetacoin to start wallet"
	ending
}
dogecoin() {
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	echo "Now installing doegecoin daemon (command line only)"
	echo "---------------------------------------------------------------------------"
	echo "---------------------------------------------------------------------------"
	sleep 2
	sudo apt-get install apt-get install build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev libdb5.3-dev libdb5.3++-dev libminiupnpc-dev
	cd ~/
	git clone https://github.com/dogecoin/dogecoin.git
	cd doegecoin
	./autogen.sh
	./configure --with-incompatible-bdb
	make 
	make install 
	cd ~/
	mkdir ~/.doegecoin
	echo rpcuser=zetarpc >> ~/.doegecoin/doegecoin.conf
	echo rpcpassword=InsertSecureP4ssH3r3 >> ~/.doegecoin/doegecoin.conf
	echo listen=1 >> ~/.doegecoin/doegecoin.conf
	echo server=1 >> ~/.doegecoin/doegecoin.conf
	echo daemon=1 >> ~/.doegecoin/doegecoin.conf
	echo rpcport=22555 >> ~/.doegecoin/doegecoin.conf
	echo "Now go into ~/.doegecoin/doegecoin.conf and add your username and password"
	echo "then run doegecoin to start wallet"
	ending
}
OPTIND=1 # Reset is necessary if getopts was used previously in the script.  It is a good idea to make this local in a function.
while getopts "Skhoausneic1lbAdDwtTNKLXGp?:" opt; do
     case "$opt" in
        h) usage
           exit 0
           ;;
        p) aosp
           exit 0
           ;;
        K) KDE
           exit 0
           ;;
        X) XFCE
           exit 0
           ;;
        L) LXDE
           exit 0
           ;;
        G) GNOME
           exit 0
           ;;
        c) cgminer
           exit 0
           ;;
        t) teamviewer32
           exit 0
           ;;
        e) emuFull
           exit 0
           ;;
        T) teamviewer64
           exit 0
           ;;
        N) nomp
           exit 0
           ;;
        o) nomp1
           exit 0
           ;;
        k) kodi
           exit 0
           ;;
        i) inst
           sleep 3
	   exit 0
	   ;;
        n) network
           sleep 3
	   exit 0
	   ;;
        w) wifite
	   exit 0
	   ;;
        l) ltc
           sleep 3
	   exit 0
	   ;;
        d) dash
           sleep 3
	   exit 0
	   ;;
	D) dogecoin
           sleep 3
	   exit 0
	   ;;
        u) update
	   sleep 3
	   exit 0
           ;;
        s) smallupdate
           sleep 3
	   exit 0
	   ;;
        S) sql
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
        A) allcoins
           sleep 3
	   exit 0
	   ;;
        a) allcoinNOnomp
           sleep 3
	   exit 0
	   ;;
    esac
 done
usage
