# -*- mode: ruby -*-
# vi: set ft=ruby :


BOX_IMAGE = "sbeliakou/centos-7.4-x86_64-minimal"

Vagrant.configure("2") do |config|

  config.ssh.username = "root"
  config.ssh.password = "vagrant"
  config.vm.box = BOX_IMAGE

 # Jenkinkd VM (Zabbix server + web + agent)
  config.vm.define :jenkins do |jenkins_config|
    jenkins_config.vm.hostname = "jenkins"
    jenkins_config.vm.network :private_network, ip: "10.0.0.10"
    jenkins_config.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.name = "jenkins"
    end

    jenkins_config.vm.provision "shell", path: "provision.sh"
    #server_config.vm.provision "file", source: "zabbix.conf.php", destination: "/etc/zabbix/web/zabbix.conf.php"
    #server_config.vm.provision "file", source: "reg_zab_host.py", destination: "/opt/reg_zab_host.py"
    #server_config.vm.provision "shell", path: "reg_zab_host.py"

    # Make a modifications take effect with new tomcat server.xml file
    #agent_config.vm.proviion "shell", inline: <<-SHELL
    #	systemctl start tomcat && systemctl enable tomcat
    #SHELL

  end



end
