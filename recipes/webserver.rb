#
# Cookbook Name:: andyregan_blog
# Recipe:: default
#
# Copyright 2013, andyregan
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx"
include_recipe "application_nginx"

directory '/srv/www'

template "/etc/nginx/sites-available/#{node['andyregan_blog']['server_name']}" do
  source "nginx_site.conf.erb"
end

nginx_site node['andyregan_blog']['server_name'] do
  action :enable
end

nginx_load_balancer do
  only_if { node['roles'].include?('andyregan_blog_load_balancer') }
end
