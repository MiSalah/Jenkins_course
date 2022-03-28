FROM jenkins/jenkins:lts

USER root

RUN apt -y update && \
    apt install -y python3-pip && \
    pip install ansible --upgrade

USER jenkins   
