FROM jenkins/jenkins:lts

USER root

RUN yum -y upgrade && yum -y update

RUN curl "https://bootstrap.pypa.io/get-pip.py" && \
    python get-pip.py && \
    pip install ansible --upgrade

USER jenkins   
