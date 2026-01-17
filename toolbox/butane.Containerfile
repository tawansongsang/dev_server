FROM quay.io/fedora/fedora-toolbox:latest
# add parallel downloads
RUN  echo "[main]" > /etc/dnf/libdnf5.conf.d/80-user-settings.conf \
    && echo "max_parallel_downloads=10" >> /etc/dnf/libdnf5.conf.d/80-user-settings.conf
# install base packages for rust developer
RUN dnf update -y \
    && dnf install neovim git luarocks ripgrep tmux butane podlet \
    fzf fd-find tree-sitter-cli \
    just \
    emacs \
    nodejs \
    golang \
    coreos-installer \
    ignition-validate \
    jq -y

# Setup variable environment
# ENV TZ=Asia/Bangkok \
#     RUSTUP_HOME=/usr/local/rustup \
#     CARGO_HOME=/usr/local/cargo \
#     PATH=/usr/local/cargo/bin:/root/.cargo/bin:$PATH \
#     LANG=th_TH.utf8 \
#     LC_ALL=th_TH.utf8

# EXPOSE 22
# ENTRYPOINT [ "/usr/sbin/sshd", "-D" ]
#ENTRYPOINT [ "nginx" , "-g", "daemon off;" ]

