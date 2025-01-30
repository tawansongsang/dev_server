FROM fedora:latest as base
RUN dnf update -y
ENV TZ="Asia/Bangkok"


FROM base as chef
RUN dnf in git \
    cargo rustup\
    rust-src rust-std-static-wasm32-unknown-unknown \
    -y
# Setup variable environment
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH
# install cargo-chef
RUN cargo install cargo-chef
# install cargo-binstall
RUN curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
WORKDIR /app


FROM chef AS planner
COPY . .
RUN cargo chef prepare --recipe-path recipe.json


FROM chef AS builder
COPY --from=planner /app/recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json
# Install dx
RUN cargo binstall dioxus-cli
COPY . .
# Create the final bundle folder. Bundle always executes in release mode with optimizations enabled
RUN dx bundle --platform web


FROM base as runtime
RUN dnf in nginx\
    -y
RUN rm -rf /usr/share/nginx/html
COPY --from=builder /app/target/dx/[project_name]/release/web/public /usr/share/nginx/html
# COPY ./target/dx/[project_name]/release/web/public /usr/share/nginx/html
COPY ./nginx/base.conf /etc/nginx/conf.d/
COPY ./nginx/spa.conf /etc/nginx/default.d/

EXPOSE 80

ENTRYPOINT [ "nginx" , "-g", "daemon off;" ]