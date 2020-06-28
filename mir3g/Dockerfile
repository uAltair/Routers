FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y subversion g++ zlib1g-dev build-essential git python &&\
 	useradd -m openwrt &&\
	echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt &&\
	sudo -iu openwrt git clone -b master https://github.com/openwrt/openwrt.git openwrt-project

# set user
USER openwrt
# set workdir
WORKDIR /home/openwrt/openwrt-project

RUN scripts/feeds update
RUN scripts/feeds install -a -p luci
RUN curl https://raw.githubusercontent.com/uAltair/Routers/master/mir3g/Diffconfig --output .config
RUN make defconfig
RUN make download
