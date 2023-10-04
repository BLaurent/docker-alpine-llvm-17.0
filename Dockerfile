FROM alpine:latest
MAINTAINER Lars Klitzke <Lars.Klitzke@gmail.com>

# install llvm in version 17.0.x
RUN wget https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.2/llvm-17.0.2.src.tar.xz && tar xvf llvm-17.0.2.src.tar.xz

# add llvm dependencies
RUN apk --no-cache add \
	autoconf \
	automake \
	freetype-dev \
	g++ \
	gcc \
	cmake \
	make \
	libxml2-dev \
	python2 \
	ncurses-dev

# configure LLVM using CMake
RUN cd llvm-17.0.2.src && mkdir build && cd build && cmake .. \
    -G "Unix Makefiles" -DLLVM_TARGETS_TO_BUILD="X86" \
    -DCMAKE_BUILD_TYPE=MinSizeRel

# build and install LLVM
RUN cd llvm-17.0.2.src/build && make -j$(nproc) && make install

RUN cd llvm-17.0.2.src/build && make -j test
# cleanup
RUN rm -r llvm-17.0.2.src
