#
# Cookbook:: cassandra
# Recipe:: default
#
# Copyright:: 2017, Giorgio Balconi, All Rights Reserved.

# Variable declaration area
private_ips = []
search("aws_opsworks_instance").each do |instance|
    private_ips.push(instance['private_ip'])
end

instance = search("aws_opsworks_instance").first
private_ip = instance['private_ip']

# Create RPM repository file in /etc/yum.repos.d/
yum_repository 'cassandra' do
  description "Apache Cassandra"
  baseurl "https://www.apache.org/dist/cassandra/redhat/311x/"
  gpgcheck true
  gpgkey 'https://www.apache.org/dist/cassandra/KEYS'
  enabled true
  action :create
end

# Installing from the RPM repository
yum_package 'cassandra'

# Configure cassandra in /etc/cassandra/conf/cassandra.yaml
template '/etc/cassandra/conf/cassandra.yaml' do
    source 'cassandra.yaml.erb'
    mode '755'
    owner 'root'
    variables ({
            private_ip: private_ip
        })
end


# Configure cassandra service to be enabled at boot and start it
service "cassandra" do
  action [:enable, :start]
end
