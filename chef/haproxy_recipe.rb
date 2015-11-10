package "haproxy" do
action :install
end

 cookbook_file "/tmp/parms_to_append.conf" do
   source "parms_to_append.conf"
 end

 bash "append_to_config" do
   user "root"
   code <<-EOF
      cat /tmp/parms_to_append.conf >> /etc/haproxy/haproxy.cfg
      rm /tmp/parms_to_append.conf
   EOF
   not_if "grep -q frontend haproxy_in /etc/haproxy/haproxy.cfg"
 end



ruby_block "enalbe haproxy" do
  block do
    file = Chef::Util::FileEdit.new("/etc/default/haproxy")
    file.search_file_replace_line( "ENABLED=0" ,"ENABLED=1")
    file.write_file
  end
end



service 'haproxy' do
  action [:enable, :restart]
end
