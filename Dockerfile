FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y curl vim python3 python3-pip git libffi-dev libssl-dev openssh-server sshpass
RUN python3 -m pip install --upgrade pip cffi && \
    pip3 install ansible && \
    pip3 install requests && \
    pip install --upgrade pywinrm && \
    ansible-galaxy collection install azure.azcollection && \
    pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt && \
    rm -rf /root/.cache/pip

ENV ANSIBLE_HOST_KEY_CHECKING=False
