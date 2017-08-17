#
# Cookbook:: elstkibn
# Recipe:: default
#
# Copyright:: 2017, Giorgio Balconi, All Rights Reserved.

# Create RPM repository file in /etc/yum.repos.d/
yum_repository 'elasticsearch-5.x' do
  description "Elasticsearch repository for 5.x packages"
  baseurl "https://artifacts.elastic.co/packages/5.x/yum"
  gpgcheck true
  gpgkey 'https://artifacts.elastic.co/GPG-KEY-elasticsearch'
  enabled true
  action :create
end

# Installing from the RPM repository
yum_package 'elasticsearch'

# Configure elasticsearch service to be enabled at boot and start it
service "elasticsearch" do
  action [:enable, :start]
end
