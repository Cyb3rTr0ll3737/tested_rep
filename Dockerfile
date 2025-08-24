FROM ubuntu:24.04

RUN apt update && \
    apt install -y openssh-server sudo && \
    mkdir /run/sshd

RUN useradd -ms /bin/bash ansible && \
    echo "ansible:ansible" | chpasswd && \
    echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible && \
    chmod 440 /etc/sudoers.d/ansible

EXPOSE 22