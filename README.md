# SSH Key adder

Use SSH key adder to put your SSH key to your remote server authorized_keys list. Just follow instructions !

### OS

This bash script (.sh) can be run from any Unix device / Mac terminal

## Installing

Just download addkey.sh or copy/paste it from raw.

```
wget https://git.io/vM7Zd -O addkey.sh
```

And run it
```
bash addkey.sh
```
OR
```
./addkey.sh
```

## How to use 

Just answer to the following prompts :

Please enter SSH user to use [root] : // Default user is root

Please enter server IP or Hostname (192.168.1.1 or myserver.com) : // IP Address of the remote server

Please enter server port [22] : // Default port is 22

### No existing key on client side

If you don't have an existing public key, don't worry, the script will create it for you, just follow instructions.

### No authorized_keys file on server side

If the server is not yet having a authorized_keys file, the script will create it for you.

### Questions ?

Having some questions ? Tweet me at @DSAndre_ !
