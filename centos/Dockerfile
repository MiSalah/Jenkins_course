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

# aws client && run the curl command alone for letting it as a step -- keep it in the cash -- for next builds
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle-1.16.312.zip" -o "awscli-bundle.zip" 

RUN  unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
    
RUN chown elbaidoury_remote:elbaidoury_remote -R /home/elbaidoury_remote/.ssh && \
    chmod 600 /home/elbaidoury_remote/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

CMD /usr/sbin/sshd -D
