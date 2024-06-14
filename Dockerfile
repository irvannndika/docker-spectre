FROM ubuntu:focal


RUN apt install curl git build-essential libssl-dev pkg-config 
RUN apt install protobuf-compiler libprotobuf-dev
RUN apt-get install clang-format clang-tidy \
clang-tools clang clangd libc++-dev \
libc++1 libc++abi-dev libc++abi1 \
libclang-dev libclang1 liblldb-dev \
libllvm-ocaml-dev libomp-dev libomp5 \
lld lldb llvm-dev llvm-runtime \
llvm python3-clang
RUN cargo install wasm-pack
RUN rustup target add wasm32-unknown-unknown
RUN git clone https://github.com/spectre-project/rusty-spectre
WORKDIR $HOME/rusty-spectre/
RUN cargo run --release --bin spectred
CMD ["/$HOME/rusty-spectre"]