# docker-bind9

Dockerized [BIND](https://www.isc.org/bind/) server for AMD64, ARM64.

Built using [Buildx](https://docs.docker.com/buildx/working-with-buildx/).

# Requirements

+ [Vagrant](https://www.vagrantup.com/)

# Example

After making your own `.env` file (using [`example.env`](example.env) as an example), run the following to build and publish the Docker images.

This process assumes that you have a `~/.docker/config.json` file on the host system with the appropriate credentials to log into [Docker Hub](https://hub.docker.com/).

```bash
make build
```

# License

[Apache 2.0](LICENSE.txt)
