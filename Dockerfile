FROM quay.io/opendatahub-contrib/workbench-images:jupyter-minimal-c9s-py39_2023a_latest
USER 0

RUN INSTALL_PKGS="java-11-openjdk java-11-openjdk-devel" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    yum -y clean all --enablerepo='*'

USER 1001