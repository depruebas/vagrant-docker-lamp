
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  ip_address = "172.28.128.110"
  config.vm.network "private_network", ip: ip_address

	config.vm.define :core, primary: true  do |core|

    core.vm.hostname = 'dev-netveloper.local'

    # Every Vagrant virtual environment requires a box to build off of.
    core.vm.box = "ubuntu/focal64"

    # Set VM system setup
    core.vm.provider :virtualbox do |p|
      p.name = "Vagrant-LAMP-DEV-Netveloper-Ubuntu_20.04"
      p.memory = 2048
      p.cpus = 1
    end

    core.vm.synced_folder "/home/depruebas/datos/EnvLamp/", "/home/vagrant/data/", nfs: true

  end

  # define, create & configure docker database with MySql Server, lasted version
  config.vm.define :db do |db|
    db.vm.provider :docker do |p|
      p.name = "netveloper_db_dev"
      p.build_dir ='vagrant/configs/mysql'
      p.env = {MYSQL_ROOT_PASSWORD: 'root', MYSQL_ROOT_HOST: '%'}
      p.ports = ['3307:3306']
      p.volumes = ["/home/depruebas/datos/mysql_data:/var/lib/mysql"]
    end

  end

  # File to install Apache2 and configure it
  config.vm.provision "shell", path: "vagrant/configs/apache/install-apache-php.sh"

  # File to install MySql Cient and configure it
  config.vm.provision "shell", path: "vagrant/configs/mysql/install-mysql-client.sh"

  # Add config in /etc/hosts into vagrant machine
  config.vm.provision "shell", path: "vagrant/final-config.sh"

  # Add config in /etc/hosts into HOST machine
  config.vm.provision :host_shell do |host_shell|
    host_shell.inline = "echo '## Vagrant LAMP config\n#{ip_address} pruebas.local\n#{ip_address} testweb.local\n' | sudo tee -a /etc/hosts"
  end

end