

# Cookbook Name:: apache
# recipe:: default
# Copyright (c) 2015 The Authors, All Rights Reserved.





package node["package_name"] do
        action :install
end

template "#{node["document_root"]}/index.html" do
        source "index.html.erb"
        mode "0644"
        end

service node["service_name"] do
        action [:enable, :start]
        end

        

