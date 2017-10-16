###### 2017-10-14

Recover Docker internet connectivity
------------------------------------

Today the following happened to me: I had no internet access from inside any Docker container, while
internet connectivity of the host computer worked without any problems.
I found several posts hinting at a DNS problem, which could be rouled out by directly pinging an ip address:
```
docker run --rm -it busybox ping -c 3 4.2.2.1
```
Restarting docker did not help - not even rebooting the host computer helped.
Luckily I found instructions how to recreate the Docker network bridge and reinitalize all the network rules on the [Moby github page](https://github.com/moby/moby/issues/866#issuecomment-19218300):
```
sudo pkill docker
sudo iptables -t nat -F
sudo ifconfig docker0 down
sudo brctl delbr docker0
sudo docker -d
```
I didn't have the command `brctl` on my Ubuntu 16.04 machine, but it could be installed by typing:
```
sudo apt install bridge-utils
```

