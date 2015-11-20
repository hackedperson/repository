#
# Cookbook Name:: apache2_source
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apache_source::webserver'
include_recipe 'apache_source::php'
include_recipe 'apache_source::apache_source'
#include_recipe 'apache_source::openldap'