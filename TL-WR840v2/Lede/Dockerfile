FROM ubuntu:xenial

RUN apt-get update &&\
	apt-get install -y sudo git-core subversion mercurial build-essential libssl-dev libncurses5-dev unzip gawk wget zlib1g-dev curl &&\
	apt-get clean -y &&\
	useradd -m lede &&\
	echo 'lede ALL=NOPASSWD: ALL' > /etc/sudoers.d/lede &&\
	sudo -iu lede git clone -b master https://github.com/lede-project/source.git lede-project &&\
	sudo -iu lede lede-project/scripts/feeds update &&\
	sudo -iu lede lede-project/scripts/feeds install -a -p luci &&\
	sudo -iu lede curl https://raw.githubusercontent.com/uAltair/Routers/master/TL-WR840v2/Lede/Diffconfig --output /home/lede/lede-project/.config
# set user
USER openwrt
# set workdir
WORKDIR /home/lede/lede-project

RUN make defconfig
RUN make download
