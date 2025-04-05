# CupsSaneDockerfile
This is the dockerfile example to build a docker image to share my old EPSON L360 printer and scaner on network. NAS is a great place for it.

i.e for EPSON L360 
```sh
#Start the docker and mount a dictory for scan and listen the port for cups and sane
docker run -d -p 631:631 -p 6566:6566 -v /var/run/dbus:/var/run/dbus -v /dev/bus/usb:/dev/bus/usb -v /Volume2/disk2:/scan --privileged=true --name cups lwmqwer/cups_sane:EPSON_L360

#After that you can use this command to scan and save on the mount dictory
docker exec -w /scan cups scanimage --mode color --resolution 300 -o out.png
```
