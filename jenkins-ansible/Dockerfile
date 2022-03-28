FROM jenkins/jenkins:lts

USER root

RUN curl "https://bootstrap.pypa.io/get-pip.py" && \
    python get-pip.py && \
    pip install ansible --upgrade

USER jenkins   
