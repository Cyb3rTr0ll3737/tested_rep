FROM ubuntu:24.04
WORKDIR /var/www/

RUN apt update && \
    apt install -y openssh-server sudo && \
    mkdir /var/run/sshd

RUN useradd -ms /bin/bash ansible && \
    echo "ansible:ansible" | chpasswd && \
    echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible && \
    chmod 440 /etc/sudoers.d/ansible

EXPOSE 22
# Можно сделать ENTRYPOINT ["tail","-f","/dev/null"], но я не хочу. Не по людски это
ENTRYPOINT ["/usr/sbin/sshd","-D"]