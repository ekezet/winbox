[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/ekezet)
## Prerequisites
### Arch Linux
`sudo pacman -S xorg-xhost`
### Debian/Ubuntu
`sudo apt install x11-xserver-utils`
### RHEL/Centos
`sudo yum install xorg-x11-server-utils`
### Intel based Mac OSX
- Install XQuartz: https://www.xquartz.org
- From the XQuartz preferences, in the `security` tab, make sure `Allow connections from network clients` is enabled then restart XQuartz.

## After the right package was installed
### Linux
`xhost +local:`
### Mac OSX
`xhost +localhost`
## If you want to just try it out:
### Linux
`docker run -it --rm --network=host --ipc=host -e DISPLAY=$DISPLAY frici/winbox`
### Intel based Mac
`docker run -it --rm --network=host -e DISPLAY=host.docker.internal:0 frici/winbox`
## Running with compose (your saved connections may persist on a named volume)
`docker-compose.yml`:
```
version: '3.6'
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
    external: false
```
Copy and paste then `docker-compose up -d`
