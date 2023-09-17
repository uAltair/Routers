# Routers [![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/ualtair/mir3g)

Firmware build tools for my routers

curl https://raw.githubusercontent.com/uAltair/Routers/master/mir3g/Dockerfile

docker build -t ualtair/mir3g .

docker run -it --user build --name mir3g  ualtair/mir3g

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin make -j$(($(nproc)+1)) V=s ; echo -e '\a'


docker cp mir3g:/home/build/openwrt/bin/targets/ramips/mt7621 s:/DockerDesktop/img
docker cp mir3g:/home/build/openwrt/bin/targets/ramips/mt7621 s:/DockerDesktop/img
