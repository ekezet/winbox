#!/bin/bash
xhost +local:
docker run -it --rm --network=host --ipc=host -e DISPLAY=$DISPLAY --mount source=winbox_winboxdata,target=/winbox/ winbox
