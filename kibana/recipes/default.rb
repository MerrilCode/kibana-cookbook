#
# Cookbook:: kibana
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute "env_variable" do
	command "export LC_ALL=C"
end

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

execute "update_kibana" do
	command "sudo update-rc.d kibana defaults 96 9"
end

execute "start_kibana" do
	command "sudo service kibana start"

end

execute "install_nginx" do
	command "sudo apt-get install nginx apache2-utils"
end

template '/etc/nginx/sites-available/default' do 
	source 'default.erb'
 	mode  '0750'
end

execute "start_nginx" do
	command "sudo service nginx restart"
end

# service 'kibana' do 
# 	action [:enable, :start]
# end
# # apt_update


