#
# Cookbook:: kibana
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute "env_variable" do
	command "export LC_ALL=C"
end

execute "get_key" do
	command "wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -"
end

execute "update sources" do
	command "echo 'deb https://artifacts.elastic.co/packages/5.x/apt stable main' | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list"
end

execute "install_kibana" do
	command "sudo apt-get update && sudo apt-get -y install kibana"
end

template '/etc/kibana/kibana.yml' do 
	source 'kibana.yml.erb'
 	mode  '0666'
end

execute "auto_start_kibana" do
	command "sudo /bin/systemctl daemon-reload && sudo /bin/systemctl enable kibana.service"
end

execute "start_k
ibana" do
	command "sudo systemctl start kibana.service"
end