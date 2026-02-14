FROM quay.io/fedora/fedora-toolbox:latest
# add parallel downloads
RUN  echo "[main]" > /etc/dnf/libdnf5.conf.d/80-user-settings.conf \
    && echo "max_parallel_downloads=10" >> /etc/dnf/libdnf5.conf.d/80-user-settings.conf
# install base packages for rust developer
RUN dnf update -y \
    && dnf group install development-tools -y \
    && dnf install git ripgrep \
    just \
    openssl-devel \
    cargo clippy rustup rust-doc rustfmt rust-analyzer \
    rust-src rust-std-static-wasm32-unknown-unknown \
    jq \
    grpcurl \
    -y

# Setup variable environment
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:/root/.cargo/bin:$PATH

# install cargo-binstall
#RUN curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

# install dioxus
#RUN cargo binstall dioxus-cli --force
# RUN curl -sSL http://dioxus.dev/install.sh | sh
RUN mkdir -p /usr/local/cargo/bin \
    && curl -sSL https://dioxus.dev/install.sh | bash

