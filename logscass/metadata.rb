name 'logscass'
maintainer 'Giorgio Balconi'
maintainer_email 'gabalconi@gmail.com'
license 'all_rights'
description 'Installs/Configures cassandra and logstash'
long_description 'Installs/Configures cassandra and logstash'
version '0.1.0'
source_url 'https://github.com/giobt/itzgio-elck'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/logscass/issues' if respond_to?(:issues_url)
issues_url 'https://github.com/giobt/itzgio-elck/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/logscass' if respond_to?(:source_url)

cookbook 'cassandra-dse', '~> 4.4.0'
cookbook 'logstash', '~> 1.0.0'
