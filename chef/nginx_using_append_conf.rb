package "nginx" do
action :install
end

 cookbook_file "/tmp/nginx.code" do
   source "nginx.code"
 end


 ruby_block "comment conf file path" do
  block do
    file = Chef::Util::FileEdit.new("/etc/nginx/nginx.conf")
    file.search_file_replace_line( "include /etc/nginx/sites-enabled/" ,"       #include /etc/nginx/sites-enabled/*;")
    file.write_file
  end
end

 bash "append_to_config" do
   user "root"
   code <<-EOF

        sed -i -e '/sites-enabled/r /tmp/nginx.code' /etc/nginx/nginx.conf
        EOF
   not_if "grep -q  upstream  /etc/nginx/nginx.conf"
 end



service 'nginx' do
  action [:enable, :restart]
end
