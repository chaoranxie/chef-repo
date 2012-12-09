Vagrant::Config.run do |config|

  config.vm.box = "centos-6.3-chef-10.14.2"
  config.vm.box_url = "https://s3.amazonaws.com/itmat-public/centos-6.3-chef-10.14.2.box"

  config.vm.network :hostonly, "33.33.2.10"
  
  config.vm.forward_port 80, 8089
  
  config.vm.host_name = "gitlab-vm"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = [ "cookbooks" ]
	chef.add_recipe "gitlab::default"
  end
end