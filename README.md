# Dev Container

## Using Base Docker Image

### using docker compose
create and run container
```bash
docker compose -f compose-dioxus.yaml up -d
```

stop and remove
```bash
docker compose -f compose-dioxus.yaml down
```

list container
``` bash
docker compose ls
```

### create docker image with podman

for rust development
``` bash
podman build -t fedora-rust-dev -f ./docker/fedora/Dockerfile.rust
```

for dioxus development
``` bash
podman build -t fedora-dioxus-dev -f ./docker/fedora/dioxus/Dockerfile.rust-dioxus
```
### create docker image with docker

for rust development
``` bash
docker build . -t fedora-rust-dev -f docker/fedora/Dockerfile.rust
```

for dioxus development
``` bash
docker build . -t fedora-dioxus-dev -f ./docker/fedora/dioxus/Dockerfile.rust-dioxus
```

### run distrobox

for rust development
``` bash
dDBX_CONTAINER_ALWAYS_PULL=0 distrobox create --image fedora-rust-dev:latest --name fedora-rust-dev --home ~/distrobox/fedora-rust-dev
distrobox enter fedora-rust-dev
```

for dioxus development
``` bash
DBX_CONTAINER_ALWAYS_PULL=0 distrobox create --image fedora-dioxus-dev:latest --name fedora-dioxus-dev --home ~/distrobox/fedora-dioxus-dev
distrobox enter fedora-dioxus-dev
```
