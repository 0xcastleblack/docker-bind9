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
	$(info      publish: Builds and publishes the Docker image)
	$(info      fullpublish: clean + publish)
	$(info      test: Builds the Docker image)
	$(info      fulltest: clean + test)
	$(info      clean: Destroys the Vagrant box)
	$(info      halt: Halts the Vagrant box)

.PHONY: halt
halt:
	vagrant halt

.PHONY: clean
clean:
	vagrant destroy -f

.PHONY: publish
publish:
	vagrant halt
	PUBLISH_IMAGE=YES vagrant up
	vagrant halt

.PHONY: fullpublish
fullpublish:
	vagrant destroy -f
	vagrant halt
	PUBLISH_IMAGE=YES vagrant up
	vagrant halt

.PHONY: test
test:
	vagrant halt
	PUBLISH_IMAGE=NO vagrant up
	vagrant halt

.PHONY: fulltest
fulltest:
	vagrant destroy -f
	vagrant halt
	PUBLISH_IMAGE=NO vagrant up
	vagrant halt