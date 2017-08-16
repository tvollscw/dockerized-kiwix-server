dockerized-kiwix-server
=================

## Step 1: Download some ZIM files

[FTP site with ZIM files](https://ftp.fau.de/kiwix/zim/).

Here are some smaller ones for testing:

1. [Assamese Medical Wikipedia (23 MB)](https://ftp.fau.de/kiwix/zim/wikipedia/wikipedia_as_medicine_2017-08.zim)
1. [English Wikipedia Bollywood Articles (265 MB)](https://ftp.fau.de/kiwix/zim/wikipedia/wikipedia_en_bollywood_2017-01.zim)
1. [Simple English Wikipedia w/ No Pictures (159 MB)](https://ftp.fau.de/kiwix/zim/wikipedia/wikipedia_en_simple_all_nopic_2016-08.zim)

## Step 2: Move the ZIM files to the 'zim' directory

```
# inside the folder where you downloaded the ZIMs (e.g. ~/Downloads)
$ mkdir -p ./dockerized-kiwix-server/zims
$ cp *.zim ./dockerized-kiwix-server/zims
```

## Step 3: Build the Docker container

This will create the Linux machine, download the Kiwix tools (including `kiwix-serve`), copy the ZIMfiles over, then create the Kiwix library XML file.

```
$ pwd # -> ./dockerized-kiwix-server
$ docker build -t kiwix-serve .
```

## Step 4: Run the container

This starts the container and the Kiwix server, and makes it available on your machine at `http://localhost:8080`.
```
$ docker run -p 8080:8080 kiwix-serve
```

To turn it off:

```
$ docker ps # -> find the container id
$ docker stop <container id>
```

## Step 5: Try it out in the browser

Go to http://localhost:8080.

