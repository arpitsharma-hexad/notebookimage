FROM registry.hub.docker.com/library/ubuntu:latest

USER 0
RUN apt-get update && apt-get install -y \
    software-properties-common
RUN add-apt-repository universe
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    python3-apt \
    python3-distutils \
    python3-dev \
    python3-venv

RUN python3 -m pip install --user --upgrade pip
RUN mkdir -p /opt/app-root/src

WORKDIR /jupyter

COPY requirements.txt start-notebook.sh /jupyter/

RUN pip3 install -r requirements.txt && rm -f requirements.txt


RUN curl -L https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-client-linux.tar.gz \
        -o /tmp/openshift-client-linux.tar.gz && \
    tar -xzvf /tmp/openshift-client-linux.tar.gz oc && \
    rm -f /tmp/openshift-client-linux.tar.gz

RUN chmod +x /jupyter/start-notebook.sh

RUN mkdir /.cache && chmod -R g+rwx /.cache && mkdir /.jupyter && chmod -R g+rwx /.jupyter && mkdir /.local && chmod -R g+rwx /.local && mkdir /.virtual_documents && chmod -R g+rwx /.virtual_documents

RUN chmod -R g+rwx /jupyter && chmod -R g+rwx /usr/lib

USER 1001

ENTRYPOINT ["/jupyter/start-notebook.sh"]