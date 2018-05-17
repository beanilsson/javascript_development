Vagrant.configure("2") do |config|
  config.vm.box = 'ubuntu/xenial64'
  config.vm.hostname = 'devbox'
  ENV['LC_ALL']="en_US.UTF-8"

  config.vm.network :private_network, ip: '192.168.50.50'
  config.vm.synced_folder '.', '/vagrant', nfs: true

  config.vm.network 'forwarded_port',
                      guest: 3000,
                      host: 4000

  config.vm.network 'forwarded_port',
                    guest: 27017,
                    host: 37017

  config.vm.network 'forwarded_port',
                    guest: 4200,
                    host: 5200

  config.vm.network 'forwarded_port',
                    guest: 8080,
                    host: 9080

  config.vm.network 'forwarded_port',
                    guest: 8088,
                    host: 9088

  config.vm.network 'forwarded_port',
                    guest: 8081,
                    host: 9081

  config.vm.provision :shell,
                      path: 'bootstrap.sh',
                      keep_color: true,
                      privileged: false
end
