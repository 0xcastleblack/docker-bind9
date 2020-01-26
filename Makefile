#!make

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

include .env
export

.PHONY: usage
usage:
	$(info    Usage:)
	$(info      build: Builds and publishes the Docker image)
	$(info      clean: Destroys the Vagrant box)
	$(info      stop: Halts the Vagrant box)
	$(info      rebuild: clean + build)
	$(info      debug: ssh into Vagrant box, if running)

.PHONY: build
build:
	vagrant halt
	vagrant up

.PHONY: clean
clean:
	vagrant destroy -f

.PHONY: rebuild
rebuild: clean build

.PHONY: halt
halt:
	vagrant halt

.PHONY: debug
debug:
	vagrant ssh
