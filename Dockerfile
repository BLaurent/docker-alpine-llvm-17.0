FROM alpine:latest
MAINTAINER Lars Klitzke <Lars.Klitzke@gmail.com>

# install llvm in version 7.0.x
RUN wget http://releases.llvm.org/7.0.1/llvm-7.0.1.src.tar.xz && tar xvf llvm-7.0.1.src.tar.xz

# add llvm dependencies
RUN apk --no-cache add \
	autoconf \
	automake \
	freetype-dev \
	g++ \
	gcc \
	cmake \
	make \
	python

# configure LLVM using CMake
RUN cd llvm-7.0.1.src && mkdir build && cd build && cmake .. \
    -G "Unix Makefiles" -DLLVM_TARGETS_TO_BUILD="X86" \
    -DCMAKE_BUILD_TYPE=MinSizeRel

# build and install LLVM
RUN cd llvm-7.0.1.src/build && make -j 1 && make install

# cleanup
RUN rm -r llvm-7.0.1.src