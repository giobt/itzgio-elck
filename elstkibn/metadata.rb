name 'elstkibn'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures elstkibn'
long_description 'Installs/Configures elstkibn'
version '0.1.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/elstkibn/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/elstkibn' if respond_to?(:source_url)
depends 'java', '~> 1.50.0'
depends 'elasticsearch', '~> 3.2.1'
depends 'kibana5', '~> 1.1.2'
