# Dev Container

## Using Base Docker Image

### create docker image with podman

for rust development
``` bash
podman build -t fedora-rust-dev -f ./docker/fedora/Dockerfile.rust
```

for dioxus development
``` bash
podman build -t fedora-dioxus-dev -f ./docker/fedora/Dockerfile.rust-dioxus
```
### create docker image with docker

for rust development
``` bash
docker build . -t fedora-rust-dev -f docker/fedora/Dockerfile.rust
```

for dioxus development
``` bash
docker build . -t fedora-dioxus-dev -f ./docker/fedora/Dockerfile.rust-dioxus
```

### run distrobox
error: connection refused

for rust development
``` bash
distrobox create --image fedora-rust-dev:latest --name fedora-rust-dev --home ~/distrobox/fedora-rust-dev
```

for dioxus development
``` bash
distrobox create --image fedora-dioxus-dev:latest --name fedora-dioxus-dev --home ~/distrobox/fedora-dioxus-dev
```