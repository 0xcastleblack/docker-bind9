<!--
#    Copyright 2020 Shawn Black <shawn@castleblack.us>
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
-->

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

# Why am I doing this?

I'm not a Docker expert nor a Vagrant expert, but I am migrating what I do have to [Podman](https://podman.io/) and [Buildah](https://buildah.io/).

Those tools do *not* support, as of right now, cross building. Docker Buildx, on the otherhand, does.

So with that being the case, I didn't want to remove what I have from my workstation, so I put together a [`Vagrantfile`](Vagrantfile) that will do it for me.

# Public Repository

[Docker Hub](https://hub.docker.com/repository/docker/0xcastleblack/bind9)

# License

[Apache 2.0](LICENSE.txt)
