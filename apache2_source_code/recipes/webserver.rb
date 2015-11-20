#
# Cookbook Name:: chef_phpldapadmin
# Recipe:: webserver
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#include_recipe "php"
include_recipe "apache2"
#include_recipe "apache2::mod_php5"


directory node['package_name']['dir'] do
  action :create
  recursive true
  owner node['package_name']['install']['user']
  group node['package_name']['install']['group']
  mode  '0755'
end

web_app "package_name" do
    template "package_name.conf.erb"
    docroot node['package_name']['dir']
  
end