#!/usr/bin/env bash
wget https://xdebug.org/files/xdebug-2.5.5.tgz

tar -xvf xdebug-2.5.5.tgz && cd xdebug-2.5.5/ && phpize && \
    ./configure --with-php-config=/usr/local/bin/php-config && make && make install
apt-get update
apt-get install -y --force-yes openssh-server vim  && \

# SSH
echo 'root:root' | chpasswd && \
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
echo "export VISIBLE=now" >> /etc/profile && \
# SSH

# Terminal type
echo 'export TERM=xterm' >> /root/.bashrc
cp /usr/local/etc/ext-xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

