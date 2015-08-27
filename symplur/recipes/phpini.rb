Chef::Log.info('Hello from Symplur')

include_recipe "apache2::service"
include_recipe "apache2::mod_php5"

# reset config to production defaults
#file "/etc/php5/apache2/php.ini" do
#  owner 'root'
#  group 'root'
#  mode 0755
#  content ::File.open("/usr/share/php5/php.ini-production").read
# action :create
#end 

template "#{node['php']['apache_conf_dir']}/php.ini" do
	source 'php.ini.erb'
	owner 'root'
	group 'root'
	mode 00644
	notifies :restart, resources(:service => 'apache2')
end
