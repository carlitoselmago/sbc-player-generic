#!/bin/sh

# Print the IP address
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi

$HOME/sbc-player-generic/automount_usb.sh
sleep 5
cd $HOME

# copy any mp4 file found in external drives
video=$(find /media -type f -name "*.mp4" | head -n 1)
if [ ! -z "$video" ]
then
echo "Found video" $video
echo "coping to local storage"
cp "$video" "./video.mp4"
else
echo "No videos found in external drives"
fi

# Set the necessary environment variables
#export XDG_RUNTIME_DIR="/run/user/$(id -u pi)"
#export PULSE_RUNTIME_PATH="/run/user/$(id -u pi)/pulse"
#export DISPLAY=:0

# Wait for X11 to be ready
#while ! pgrep "Xorg" > /dev/null; do
#  sleep 1
#done
mpv --loop --fs $HOME/video.mp4
#gst-launch-1.0 playbin uri=file:///home/pi/video.mp4

