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

FROM alpine:3.6.5

LABEL maintainer="shawn@castleblack.us"

ENV BIND_VERSION=9.11.6_p1 \
    BIND_ALPINE_SUFFIX=r1 \
    DUMB_INIT_VERSION=1.2.0 \
    DUMB_INIT_ALPINE_SUFFIX=r0

RUN apk update && apk --no-cache add bind=${BIND_VERSION}-${BIND_ALPINE_SUFFIX} dumb-init=${DUMB_INIT_VERSION}-${DUMB_INIT_ALPINE_SUFFIX}

EXPOSE 53/udp 53/tcp

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/usr/sbin/named"]