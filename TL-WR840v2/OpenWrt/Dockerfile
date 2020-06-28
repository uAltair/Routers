FROM ubuntu:lates

RUN apt-get update &&\
	apt-get install -y sudo git-core subversion mercurial build-essential libssl-dev libncurses5-dev unzip gawk wget zlib1g-dev curl &&\
	apt-get clean -y &&\
 	useradd -m openwrt &&\
	echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt &&\
	sudo -iu openwrt git clone -b master https://github.com/openwrt/openwrt.git openwrt-project
	
# set user
USER openwrt
# set workdir
WORKDIR /home/openwrt/openwrt-project

RUN scripts/feeds update
RUN scripts/feeds install -a -p luci
RUN curl https://raw.githubusercontent.com/uAltair/Routers/master/TL-WR840v2/OpenWrt/Diffconfig --output .config
RUN make defconfig
RUN make download
