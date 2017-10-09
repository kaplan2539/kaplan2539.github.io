###### (insert date here)

Linux Kernel Hacking with C.H.I.P part 1: setup buidroot
--------------------------------------------------------

This is part of a series of blog posts explaining how to hack the Linux kernel
on the $9 C.H.I.P computer.


## Requirements

1. In the following it is assumed you are working on a computer running Ubuntu Linux 16.04
connected to the internet.
2. The Ubuntu machine needs at least two free USB ports.
3. A USB uart adapter that works with Ubuntu 16.04.
4. Next Thing Co's $9 computer C.H.I.P
5. A way to connect C.H.I.P's FEL pin to GND, e.g. a paper clip or a short wire.


## Install Packages on Ubuntu 16.04

```
sudo apt update
sudp apt install ALL THE PACKAGES
```


## Setup a working directory and download Buildroot


