# -*- mode: ruby -*-
# vi: set ft=ruby :

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

$set_environment_variables = <<SCRIPT
tee "/etc/profile.d/vagrant-docker-buildx-vars.sh" > "/dev/null" <<EOF
export DOCKER_CLI_EXPERIMENTAL=enabled
EOF
SCRIPT

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.box = "generic/ubuntu1804"
  config.vm.network "private_network", type: "dhcp"
  config.vm.hostname = "vagrant-docker-buildx-bind9"
  config.vm.synced_folder ".", "/vagrant", disabled: false
  #config.vm.synced_folder "~/.docker/", "/root/.docker/", disabled: false
  config.vm.synced_folder "~/.docker/", "/root/.docker/", type: "rsync", rsync__auto: false
  config.vm.provider "virtualbox" do |vb|
    vb.name = "vagrant-docker-buildx-bind9"
    vb.memory = 2048
    vb.cpus = 2
  end
  config.vm.provider "vmware_desktop" do |vm|
    vm.vmx["memsize"] = "2048"
    vm.vmx["numvcpus"] = "2"
  end
  config.vm.provision "shell", inline: $set_environment_variables, run: "always"
  config.vm.provision "docker" do |docker|
  end
  config.vm.provision "shell", inline: "docker buildx install && docker run --rm --privileged docker/binfmt:$1 && cat /proc/sys/fs/binfmt_misc/qemu-aarch64", run: "always", args: "#{ENV['BINFMT']}"
  config.vm.provision "shell", inline: "docker buildx create --name vagrant-docker-buildx-bind9 && docker buildx use vagrant-docker-buildx-bind9 && docker buildx inspect --bootstrap", run: "always"
  config.vm.provision "shell", inline: "docker buildx build /vagrant/alpine --platform linux/arm64,linux/amd64 -t $1/$2:latest        -t $1/$2:`date +%Y%m%d`-alpine --no-cache --push", run: "always", args: "#{ENV['REGISTRY_ACCOUNT']} #{ENV['IMAGE_NAME']}"
  config.vm.provision "shell", inline: "docker buildx build /vagrant/ubuntu --platform linux/arm64,linux/amd64 -t $1/$2:latest-ubuntu -t $1/$2:`date +%Y%m%d`-ubuntu --no-cache --push", run: "always", args: "#{ENV['REGISTRY_ACCOUNT']} #{ENV['IMAGE_NAME']}"
  config.vm.provision "shell", inline: "docker buildx imagetools inspect $1/$2", run: "always", args: "#{ENV['REGISTRY_ACCOUNT']} #{ENV['IMAGE_NAME']}"
  config.vm.provision "shell", inline: "docker system prune -a -f", run: "always"
  config.vm.provision "shell", inline: "shutdown -h now", run: "always"
end
