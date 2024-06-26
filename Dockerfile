FROM ubuntu:focal

RUN apt-get update -y
RUN apt-get install curl git build-essential libssl-dev pkg-config -y
RUN apt-get install protobuf-compiler libprotobuf-dev -y
RUN apt-get install clang-format clang-tidy \
clang-tools clang clangd libc++-dev \
libc++1 libc++abi-dev libc++abi1 \
libclang-dev libclang1 liblldb-dev \
libllvm-ocaml-dev libomp-dev libomp5 \
lld lldb llvm-dev llvm-runtime \
llvm python3-clang -y

# Build stage
FROM rust:bookworm AS builder


RUN cargo install wasm-pack
RUN rustup target add wasm32-unknown-unknown
RUN git clone https://github.com/spectre-project/rusty-spectre && cd rusty-spectre
CMD ["/$HOME/rusty-spectre"]
