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
	build-essential \
	flex \
	bison \
	libelf-dev \
	bc \
	libssl-dev
RUN echo "${USERNAME}:${PASSWORD}" | chpasswd && \
    gpasswd -a ${USERNAME} sudo && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER ${USERNAME}
WORKDIR /home/${USERNAME}/
RUN git clone https://github.com/llvm/llvm-project.git -b llvmorg-18.1.6 --depth 1
RUN cd llvm-project && \
    cmake -S llvm -B build -G "Ninja" \
	-DCMAKE_BUILD_TYPE=Release \
	-DLLVM_BUILD_EXTERNAL_COMPILER_RT=ON \
	-DLLVM_ENABLE_LIBCXX=ON \
	-DLLVM_ENABLE_PROJECTS="clang;lld" \
	-DLLVM_ENABLE_RUNTIMES="libcxx;libunwind;libcxxabi" \
	-DLLVM_INCLUDE_DOCS=OFF \
	-DLLVM_INCLUDE_TESTS=OFF \
	-DLLVM_TARGETS_TO_BUILD="host;BPF" \
	-Wno-dev && \
    ninja -C build && \
    sudo ninja -C build install
ENV LD_LIBRARY_PATH=/usr/local/lib/x86_64-unknown-linux-gnu

