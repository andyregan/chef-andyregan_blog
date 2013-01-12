#
# Cookbook Name:: andyregan_blog
# Recipe:: default
#
# Copyright 2013, andyregan
#
# All rights reserved - Do Not Redistribute
#
include_recipe "git"

application_name = "andyregan_blog"
app_node = node[application_name]
root_path = "/srv/#{application_name}"

application application_name do
  path root_path
  owner "nobody"
  group "nogroup"
  repository app_node[:repository]
  revision app_node[:revision]

  nginx_load_balancer do
    only_if { node['roles'].include?("#{application_name}_load_balancer") }
    application_port app_node[:application_port]
    server_name app_node[:server_name]
    port app_node[:port]
  end
end

if node['roles'].include?("#{application_name}_application_server")
  include_recipe "nginx"

  template "/etc/nginx/sites-available/#{application_name}.conf" do
    only_if { node['roles'].include?("#{application_name}_application_server") }
    source "nginx_site.conf.erb"
  end

  nginx_site "#{application_name}.conf" do
    only_if { node['roles'].include?("#{application_name}_application_server") }
    action :enable
  end

  nginx_site "000-default" do
    enable false
  end

  nginx_site "default" do
    enable false
  end
end
