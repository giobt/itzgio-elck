#
# Cookbook:: elasticsearch
# Recipe:: default
#
# Copyright:: 2017, Giorgio Balconi, All Rights Reserved.

# Variable declaration area
instance = search("aws_opsworks_instance").first
private_ip = instance['private_ip']

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

# Configure heap size in jvm.options
template '/etc/elasticsearch/jvm.options' do
    source 'jvm.options.erb'
    mode '755'
    owner 'root'
end

# Configure heap size in /etc/sysconfig/elasticsearch
template '/etc/elasticsearch/elasticsearch.yml' do
    source 'elasticsearch.yml.erb'
    mode '0755'
    owner 'root'
    variables ({
            private_ip: private_ip
        })
end

# Configure elasticsearch service to be enabled at boot and start it
service "elasticsearch" do
  action [:enable, :start]
end
