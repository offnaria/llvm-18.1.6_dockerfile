FROM amd64/ubuntu:24.04

ARG USERNAME="ubuntu"
ARG PASSWORD="ubuntu"

RUN apt update && \
    apt install -y \
	sudo \
	git \
	ninja-build \
	cmake \
	python3 \
	build-essential
#RUN useradd -m -s /bin/bash ${USERNAME}
RUN echo "${USERNAME}:${PASSWORD}" | chpasswd && \
    gpasswd -a ${USERNAME} sudo

USER ${USERNAME}
WORKDIR /home/${USERNAME}/

