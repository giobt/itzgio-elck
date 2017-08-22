#
# Cookbook:: kibana
# Recipe:: default
#
# Copyright:: 2017, Giorgio Balconi, All Rights Reserved.

private_ip = instance['private_ip']

# Create RPM repository file in /etc/yum.repos.d/
yum_repository 'kibana-5.x' do
  description "Kibana repository for 5.x packages"
  baseurl "https://artifacts.elastic.co/packages/5.x/yum"
  gpgcheck true
  gpgkey 'https://artifacts.elastic.co/GPG-KEY-elasticsearch'
  enabled true
  action :create
end

# Installing from the RPM repository
yum_package 'kibana'

# Configure kibana
template '/etc/kibana/kibana.yml' do
    source 'kibana.yml.erb'
    mode '0755'
    owner 'root'
    variables ({
            private_ip: private_ip
        })
end

# Configure kibana service to be enabled at boot and start it
service "kibana" do
  action [:enable, :start]
end
