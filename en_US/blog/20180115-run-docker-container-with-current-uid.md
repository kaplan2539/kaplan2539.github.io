###### 2018-01-15

Run Docker container with current users UID/GUID
------------------------------------------------

I often use Docker to try out software in an isolated environment without
'polluting' my workstation with the installation of dependencies.
It is also very useful to bundle dependencies for a certain project in a Docker
image, e.g. the compiler toolchain for the latest single board computer.

In the following I describe a very trivial example: Instead of installing the
`zip` package on my Ubuntu workstation, I decide to create a Docker container
image base on the latest Debian version that has `zip` installed.

First we need a `Dockerfile`:
```
FROM debian

RUN apt update && apt install -y zip sudo
```

Now run `docker build` in the directory of the `Dockerfile`:
```
docker build -t zipper .
```

So, to create a zip achive that contains all the file in let's say
`$HOME/Pictures` we can run
```
docker run --rm -it -v $HOME/Pictures:/Pictures -v $PWD:/work -w /work \
  zipper \
  bash -c 'zip pictures.zip /Pictures/*'
```

This leaves us with the archive file `pictures.zip` in the current directory:
```
-rw-r--r-- 1 root root 2578830 Jan 15 10:24 pictures.zip
```

But what's that? The file is owned by root.  To change that we have to tell
Docker to run the the container with your current users UID/GUID:
```
docker run --rm -it -v $HOME/Pictures:/Pictures -v $PWD:/work -w /work \
   -u $(id -u):$(id -g) \
   zipper \
   bash -c 'zip pictures2.zip /Pictures/*'
```

This time `pictures2.zip` is owned by the current user:
```
-rw-r--r-- 1 alex alex 2578830 Jan 15 10:30 pictures2.zip
```

As part of an automated build process there are often scripts that run
inside of a Docker container that should produces files that are accessible by
the current workstation user but in addition need to acquire super-user rights
for certain taskts. That's very the `sudo` command comes in.
However, simply running the trivial example
```
docker run --rm -it -v $HOME/Pictures:/Pictures -v $PWD:/work -w /work \
   -u $(id -u):$(id -g) \
   zipper \
   sudo bash -c 'zip shadow.zip /etc/shadow'
``` 
gives the error message:
```
sudo: unknown uid 1000: who are you?
```
Let's fix that! We need top pass in your workstations `/etc/password` and
`/etc/group` into our container environment:
```
docker run --rm -it -v $HOME/Pictures:/Pictures \
  -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/groupd:ro \
  -v $PWD:/work -w /work -u $(id -u):$(id -g) zipper \
  sudo bash -c 'zip shadow.zip /etc/shadow'
```

Now we are one step further, and sudo asks us for our password:
```
We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for alex:
```

However, even if you entered your workstation user's password you won't get
access because we haven't passed in `/etc/shadow` into our container.
Anyway, manually entering a password in an automated build script is probably
not what you want. Therefore, we setup sudo to work passwordless (only inside
our container, of course) by first creating a `sudoers` file in the current
directory with the follwing content:
```
ALL            ALL = (ALL) NOPASSWD: ALL
```

Now this file needs to be owned by root. On your workstation type:
```
sudo chown root:root sudoers
```

And finally we pass in our passwordless `sudoers` file and try again:
```
docker run --rm -it -v $HOME/Pictures:/Pictures \
  -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/groupd:ro \
  -v $PWD/sudoers:/etc/sudoers
  -v $PWD:/work -w /work -u $(id -u):$(id -g) zipper \
  sudo bash -c 'zip shadow.zip /etc/shadow'
```
Et voilà! It works.

I admit, on first sight my example appears pointless: we are first changing to
a less priviledged user to run our cotainer only to acquire super-user rights
later on. However, in more advanced examples, e.g. building Debian packages for
a different architecture in a Docker container this can be really useful.
