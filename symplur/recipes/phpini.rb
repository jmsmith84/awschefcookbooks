Chef::Log.info('Hello from Symplur')

# allows it to restart the apache2 service
include_recipe "apache2::service"
 
# update php config
file "/etc/php5/apache2/php.ini" do
  content <<-EOH

  ; Custom PHP Configuration
  ; display_errors = "On"
  memory_limit = #{node[:phpini][:memorylimit]}
  max_execution_time = #{node[:phpini][:maxexecutiontime]}
  max_input_time = #{node[:phpini][:maxinputtime]}
 
  EOH
  notifies :restart, resources(:service => 'apache2')
end