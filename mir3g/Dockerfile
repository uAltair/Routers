FROM ubuntu:latest
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install -y apt-utils curl libidn2 subversion g++ zlib1g-dev build-essential git python python3 python3-distutils libncurses5-dev gawk gettext unzip file libssl-dev wget libelf-dev ecj fastjar java-propose-classpath sudo &&\
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
