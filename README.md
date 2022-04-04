# Duo Authentication Proxy - Containerized
This repository contains the appropriate files and examples to create your own Duo Authentication Proxy container.  This is an incredibly useful tool when testing or demoing Duo Authenticaiton Proxy.

## Usage

### 1. Build the Container
To build your Duo Authentication Proxy container, simply clone this folder and build the container in the cloned folder.  This step will take some time as we have to complice the code.
```
docker build -t Duo_Auth_Proxy_Latest
```

> Pro Tip: A new version of Duo Authentication Proxy is out?  Simply rebuild the container!

### 2. Run the Container
Once the container is built, run the container!  An example command is provided which will mount your working directory into the container at the /configs location.
```
docker run -d -v "$(pwd)":/configs --name DAP Duo_Auth_Proxy_Latest
```

### 3. Configure Duo Authentication Proxy
Once the container is running, you can access the container's shell to configure and start the proxy - example is as follows.
```
docker exec -it DAP /bin/bash
```

You can copy your pre-generated configuration file from the "/configs" folder to the "/opt/duoauthproxy/conf" folder - example is as follows.
```
cp /configs/my-dap-config.cfg /opt/duoauthproxy/conf/authproxy.cfg
```

> Pro Tip: The Duo Authentication Proxy config file MUST be named "authproxy.cfg"

### 4. Start Duo Authentication Proxy
Start the proxy!
```
/etc/init.d/duoauthproxy start
```

## Configuration Assistance and Useful Links
An [example](./authproxy.cfg.example) Duo Authentication Proxy configuraiton file h as been included.  Use this file as a starting point for creating your own custom configuration.  Links to the appropriate reference material are as follows.

- [Duo Authentication Proxy Reference](https://duo.com/docs/authproxy-reference)
- [Duo SSO Documentation](https://duo.com/docs/sso)
- [Docker Documentation](https://docs.docker.com/get-started/02_our_app/)