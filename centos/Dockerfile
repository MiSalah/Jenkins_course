FROM centos:7

RUN yum -y upgrade && yum -y update

RUN yum -y install openssh-server

RUN useradd elbaidoury_remote && \
    echo "admin" | passwd elbaidoury_remote --stdin && \
    mkdir /home/elbaidoury_remote/.ssh && \
    chmod 700 /home/elbaidoury_remote/.ssh

COPY remote-key.pub /home/elbaidoury_remote/.ssh/authorized_keys 
# you have to generate the ssh keys

RUN chown elbaidoury_remote:elbaidoury_remote -R /home/elbaidoury_remote/.ssh && \
    chmod 600 /home/elbaidoury_remote/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

CMD /usr/sbin/sshd -D