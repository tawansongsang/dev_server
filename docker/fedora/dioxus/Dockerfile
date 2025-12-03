FROM quay.io/fedora/fedora:43 AS base
# add parallel downloads
RUN  echo "[main]" > /etc/dnf/libdnf5.conf.d/80-user-settings.conf \ 
    && echo "max_parallel_downloads=10" >> /etc/dnf/libdnf5.conf.d/80-user-settings.conf
RUN dnf update -y && dnf in glibc-langpack-th glibc-langpack-en -y
ENV TZ="Asia/Bangkok" \
    LANG=th_TH.utf8 \
    LC_ALL=th_TH.utf8


FROM base AS chef
RUN dnf group install development-tools -y \
    && dnf in git \
    cargo rustup \
    rust-src rust-std-static-wasm32-unknown-unknown \
    -y
# Setup variable environment
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:/root/.cargo/bin:$PATH 
# install cargo-chef
RUN cargo install cargo-chef
# # install cargo-binstall
# RUN curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
WORKDIR /app


FROM chef AS planner
COPY . .
RUN cargo chef prepare --recipe-path recipe.json


FROM chef AS builder
COPY --from=planner /app/recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json
# install dx
RUN mkdir -p /root/.cargo/bin
RUN curl -sSL http://dioxus.dev/install.sh | sh
ENV PATH="/root/.cargo/bin:$PATH"
COPY . .
# Create the final bundle folder. Bundle always executes in release mode with optimizations enabled
RUN dx bundle --web --release


FROM quay.io/fedora/fedora-minimal:43 AS runtime
RUN dnf in nginx\
    -y
RUN rm -rf /usr/share/nginx/html
COPY --from=builder /app/target/dx/[project_name]/release/web/public /usr/share/nginx/html
# COPY ./target/dx/[project_name]/release/web/public /usr/share/nginx/html
COPY ./nginx/base.conf /etc/nginx/conf.d/
COPY ./nginx/spa.conf /etc/nginx/default.d/

# expose the port 80
EXPOSE 80

ENTRYPOINT [ "nginx" , "-g", "daemon off;" ]