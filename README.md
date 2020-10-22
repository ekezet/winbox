# Winbox container

## Prerequisites

### Arch Linux

sudo pacman -S xorg-xhost

### Ubuntu

sudo apt install x11-xserver-utils

### Centos

sudo yum install xorg-x11-server-utils

## After the right package was installed

xhost +local:

## If you want to just try it out:

docker run -it --rm --network=host -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY frici/winbox:3.24

## Running with compose (your saved connections may persist on a named volume)

docker-compose up -d
