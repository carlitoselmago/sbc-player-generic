# SBC player generic 
A basic video looper for many SBC, it asumes you have mpv installed on your system
but you can replace the player with the player available on the system

I doesn't requiere additional software for the automount usb part

## Installation

create a cron tab with

```
sudo crontab -e
```
and place 

@reboot /locationofthisrepo/onboot.sh

## download a sample video

```
wget https://github.com/turingmachine/omxplayer-sync/raw/master/synctest.mp4
mv synctest.mp4 $HOME/video.mp4 
```
