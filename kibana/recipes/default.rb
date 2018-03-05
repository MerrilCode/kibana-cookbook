#
# Cookbook:: kibana
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute "get_key" do
	command "wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -"
end

execute "update sources" do
	command "echo 'deb http://packages.elastic.co/kibana/4.5/debian stable main' | sudo tee -a /etc/apt/sources.list"
end

execute "install_kibana" do
	command "sudo apt-get update && sudo apt-get -y install kibana"
end

template '/opt/kibana/config/kibana.yml' do 
	source 'kibana.yml.erb'
 	mode  '0750'
end

service 'kibana' do 
	action [:enable, :start]
end
# apt_update


