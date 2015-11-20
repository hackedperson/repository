# override['apache']['version'] = '2.2'
# override['apache']['package']     = 'httpd'
# override['apache']['devel_package'] = 'httpd-devel'



default['package_name']['url'] = "http://www.us.apache.org/dist//httpd/httpd-2.4.17.tar.gz"


case node['platform']
when 'redhat', 'centos', 'scientific', 'fedora', 'amazon', 'oracle'
  default["package_name"] ="httpd"
        default["service_name"] ="httpd"
        default["document_route"] ="/var/www/html"
default['phpldapadmin']['install']['user'] = 'apache'
	default['phpldapadmin']['install']['group'] = 'apache'        
        
        
when 'debian', 'ubuntu'
	     default["package_name"] ="apache2"
        default["service_name"] ="apache2"
        default["document_route"] ="/var/www/html"
default['phpldapadmin']['install']['user'] = 'www'
	default['phpldapadmin']['install']['group'] = 'www'

end


default['package_name']['parent_dir'] = "#{node['document_route']}"
default['package_name']['dir'] = "#{node['package_name']['parent_dir']}/package_name"



default['php5']['phppackages'] = ["php55", "php55-devel", "php55-common", "php55-cli", "php55-pecl-apc", "php55-pdo", "php55-xml", "php55-gd", "php55-mbstring", "php-pear", "php55-mysqlnd", "php55-mcrypt", "php55-ldap"]
