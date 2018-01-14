FROM ubuntu:xenial

RUN apt-get update &&\
	apt-get install -y sudo git-core subversion mercurial build-essential libssl-dev libncurses5-dev unzip gawk wget zlib1g-dev curl &&\
	apt-get clean -y &&\
	useradd -m lede &&\
	echo 'lede ALL=NOPASSWD: ALL' > /etc/sudoers.d/lede &&\
USER lede
WORKDIR /home/lede/lede-project
RUN git clone -b master https://github.com/lede-project/source.git lede-project &&\
	/scripts/feeds update &&\
	/scripts/feeds install -a -p luci &&\
	curl https://raw.githubusercontent.com/uAltair/Routers/master/TL-WR840v2/Lede/Diffconfig --output /.config %%\
	make defconfig
