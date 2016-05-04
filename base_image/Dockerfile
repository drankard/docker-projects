FROM ubuntu:14.04


RUN apt-get update -qq
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y

RUN apt-get clean
RUN apt-get update -qq
RUN apt-get install -y git openssh-server python-apt python-software-properties software-properties-common
RUN apt-get install -y --reinstall ca-certificates
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update -qq
RUN apt-get install -y ansible

RUN mkdir /var/run/sshd
RUN chmod 0755 /var/run/sshd

RUN useradd -m -s /bin/bash  ansible_user
RUN echo "ansible_user ALL=(ALL) NOPASSWD:ALL" >>  /etc/sudoers

#RUN mkdir /home/ansible_user/.ssh
#RUN chmod 700 /home/ansible_user/.ssh
#ADD ./ssh_key /home/ansible_user/.ssh/id_rsa
#ADD ./ssh_key.pub /home/ansible_user/.ssh/id_rsa.pub
#RUN cat /home/ansible_user/.ssh/id_rsa.pub >> /home/ansible_user/.ssh/authorized_keys
RUN chown -R ansible_user:ansible_user /home/ansible_user
# RUN chmod 600 /home/ansible_user/.ssh/authorized_keys /home/ansible_user/.ssh/id_rsa
# RUN chmod 0644 /home/ansible_user/.ssh/id_rsa.pub
# RUN echo "Host *\n\tStrictHostKeyChecking no\n" >> /home/ansible_user/.ssh/config

RUN cp /usr/share/vim/vimrc /home/ansible_user/.vimrc
RUN echo "TERM=xterm" >> /home/ansible_user/bashrc

EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
