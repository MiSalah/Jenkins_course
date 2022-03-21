FROM centos:7

RUN yum -y upgrade && yum -y update

RUN yum -y install openssh-server

RUN useradd elbaidoury_remote && \
    echo "admin" | passwd elbaidoury_remote --stdin && \
    mkdir /home/elbaidoury_remote/.ssh && \
    chmod 700 /home/elbaidoury_remote/.ssh

COPY remote-key.pub /home/elbaidoury_remote/.ssh/authorized_keys 
# you have to generate the ssh keys

# install the mysql client
RUN yum -y install mysql 

# Install unzip 
RUN yum -y install unzip

# switch to python3.6
RUN sudo yum -y install centos-release-scl && \
    sudo yum -y install rh-python36 && \
    scl enable rh-python36 bash

# aws client
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install
    
RUN chown elbaidoury_remote:elbaidoury_remote -R /home/elbaidoury_remote/.ssh && \
    chmod 600 /home/elbaidoury_remote/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

CMD /usr/sbin/sshd -D
