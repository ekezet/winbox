# Winbox in Container

This is a container for running Winbox when you don't want to install wine just for this.

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/ekezet)

## Prerequisites

### Arch Linux

```shell
sudo pacman -S xorg-xhost
```

### Debian/Ubuntu

```shell
sudo apt install x11-xserver-utils
```

### RHEL/Centos

```shell
sudo yum install xorg-x11-server-utils
```

### Intel based Mac OSX

- Install XQuartz: <https://www.xquartz.org>
- From the XQuartz preferences, in the `security` tab, make sure `Allow connections from network clients` is enabled then restart XQuartz.

## After the right package was installed

### Linux

```shell
xhost +local:
```

### Mac OSX

```shell
xhost +localhost
```

## If you want to just try it out

### On Linux

```docker
docker run -it --rm --network=host --ipc=host -e DISPLAY=$DISPLAY frici/winbox
```

### On Intel based Mac

```docker
docker run -it --rm --network=host -e DISPLAY=host.docker.internal:0 frici/winbox
```

## Running with compose (your saved connections may persist on a named volume)

```yaml
services:
  winbox:
    image: frici/winbox
    container_name: winbox
    restart: on-failure
    network_mode: host
    environment:
      - DISPLAY=:0
      - ipc=host
    volumes:
      - /tmp/.X11-unix:/tmp/.X11-unix
      - winboxdata:/winbox/
volumes:
  winboxdata:
```

Copy and paste then `docker compose up`

## Building with your preferred winbox version

If you can't find your preferred version in dockerhub you can build it for yourself. For example version 3.40:

```shell
export WV=3.40
```

```docker
docker build -f ./Dockerfile -t yourimagename:$WV . --no-cache --build-arg WV=$WV
```
