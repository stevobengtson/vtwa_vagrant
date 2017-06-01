mysql_service 'default' do
  port node[:mysql_config][:port] || '3306'
  version node[:mysql_config][:version] || nil
  bind_address node[:mysql_config][:bind_address] || '0.0.0.0'
  initial_root_password node[:mysql_config][:root_password] || 'changeme'
  action %i[create start]
end
