# alpine-ftp

A minimal Docker image based on Alpine Linux ready to launch a FTP server !

It also contains tools for Netfilter.

# How to build this Dockerfile.

<pre>
$ docker build -t ftp/alpine -f Dockerfile .
</pre>

# How to run the docker container with ftp ?

The port 20 and 21 in the Dockerfile are exposed. You can use the below command to run the docker container.

<pre>
$ docker run --privileged -ti -p 21:21 -p 20:20 -p 30000-30010:30000-30010 ftp/alpine
</pre>

Then, in the container, to run the FTP server,

<pre>
$ /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
</pre>

To connect the docker container via ftp,

<pre>
$ ftp {ip container}
</pre>

* User : <b> ftpuser </b>
* Password: <b> password </b>
