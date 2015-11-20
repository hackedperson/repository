#
# Cookbook Name:: apache_sorce
# Recipe:: package_name
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

 
cookbook_file "#{Chef::Config[:file_cache_path]}/httpd-2.4.17.tar.gz" do
  source 'httpd-2.4.17.tar.gz'
  mode '0644'
  action :create
end

tar_extract "#{Chef::Config[:file_cache_path]}/httpd-2.4.17.tar.gz" do
  action :extract_local
  target_dir node['package_name']['dir']
  user node['package_name']['install']['user']
  group node['package_name']['install']['group']
  tar_flags [ '--strip-components 1' ]
  not_if { ::File.exists?("#{node['package_name']['dir']}/index.php") }
end