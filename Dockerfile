FROM debian:bullseye

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
     openssh-client sshpass
