# Valheim Server in a Docker Container

Build with:

```
docker build -t my-valheim-image .
```

Run with (instead of net=host, -p is possible):

```
docker run -d --rm --net=host --name my-valheim-server \
  -v /valheim/install/dir:/valheim \
  my-valheim-image \
  <instanc> "<servername>" <password> <port>
```

- Set `<instance>` to the name you want to use for your configs and world - no whitespaces
- Set `<servername>` to the name you want to have the server in the serverbrowser - can contain whitespaces, mind the ""
- Set `<password>` to the password you want for your server - no whitespaces
- Set `<port>` if you want it to be different from 2456

The container will install the valheim server to /valheim. On the first run, mount an empty directory (/valheim/install/dir) from your host to /valheim in the container. The world and config will be saved to /valheim/install/dir/<instance> to make them persistent.

Additional information:

- Minimum password length is 5 characters 
- Password cant be in the server name.
- You need to make sure the (udp) port you chose and the next 2 are being forwarded to the container.
  The default port is 2456.

