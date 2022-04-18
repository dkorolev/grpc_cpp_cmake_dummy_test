FROM ubuntu:focal-20220404

RUN apt-get update -y
RUN apt-get install -y bash git build-essential vim
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN apt-get install -y cmake

ENV GRPC_CPP_CMAKE_DUMMY_DEBUG_BUILD_DIR=/tmp/grpc_build/debug
ENV GRPC_CPP_CMAKE_DUMMY_RELEASE_BUILD_DIR=/tmp/grpc_build/release

WORKDIR /
RUN git clone https://github.com/dkorolev/grpc_cpp_cmake_dummy_test.git
RUN (cd grpc_cpp_cmake_dummy_test; make release)

CMD "/tmp/grpc_build/release/test_add"
