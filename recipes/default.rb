#
# Cookbook Name:: andyregan_blog
# Recipe:: default
#
# Copyright 2013, andyregan
#
# All rights reserved - Do Not Redistribute
#
include_recipe "git"
include_recipe "nginx"

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
        application_port app_node[:application_port]
        server_name app_node[:server_name]
        port app_node[:port]
        only_if { node['roles'].include?("#{application_name}_load_balancer") }
    end
end

nginx_site "000-default" do
  enable false
end

nginx_site "default" do
    enable false
end

template "/etc/nginx/sites-available/#{node['andyregan_blog']['server_name']}" do
  source "nginx_site.conf.erb"
  only_if { node['roles'].include?("#{application_name}_application_server") }
end

nginx_site node['andyregan_blog']['server_name'] do
  action :enable
  only_if { node['roles'].include?("#{application_name}_application_server") }
end

