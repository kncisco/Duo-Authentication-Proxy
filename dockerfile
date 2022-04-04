FROM ubuntu:latest

### Install Deps ###
RUN apt update && apt-get -y install \
build-essential \
libffi-dev \
perl \
zlib1g-dev \
wget

### Get Duo Authentication Proxy - latest build ###
RUN wget --content-disposition https://dl.duosecurity.com/duoauthproxy-latest-src.tgz

### Un-tar/Unzip + complie + install Duo Authentication Proxy ###
RUN tar xzf duoauthproxy-*-src.tgz && \
cd duoauthproxy*/ && \
make && \ 
./duoauthproxy-build/install \
--install-dir /opt/duoauthproxy \
--service-user duo_authproxy_svc \
--log-group duo_authproxy_grp \
--create-init-script yes \
--enable-selinux=no

### Expose RADIUS & LDAP Ports ###
EXPOSE 1812/udp
EXPOSE 389/tcp
EXPOSE 389/udp 

### Ensure container runs continuously
ENTRYPOINT ["tail", "-f", "/dev/null"]
