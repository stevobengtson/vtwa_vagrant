name 'mysql_config'
maintainer 'Varsity Tutors Inc.'
maintainer_email 'steven.bengtson@varsitytutors.com'
version '1.0.0'
depends 'mysql', '~> 8.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
