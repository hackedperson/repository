# Cookbook Name:: apache
# atribute:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

case node["platform"]
    when "ubuntu"
        default["package_name"] ="apache2"
        default["service_name"] ="apache2"
        default["document_route"] ="/var/www/html"
    when "centos"
        default["package_name"] ="httpd"
        default["service_name"] ="httpd"
        default["document_route"] ="/var/www/html"
				
 end